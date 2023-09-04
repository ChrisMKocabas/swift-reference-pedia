import Foundation

/// Merge sorts an array in place
func mergeSort(inputArray: inout [Int]) {
    let inputLength = inputArray.count

    // Base case: If the array has only one or zero elements, it is already sorted.
    guard inputLength > 1 else { return }

    // Calculate the middle index of the array.
    let midIndex = inputLength / 2

    // Split the array into two halves.
    var leftHalf: [Int] = Array(inputArray[0..<midIndex])
    var rightHalf: [Int] = Array(inputArray[midIndex..<inputLength])

    // Recursively sort the left and right halves.
    mergeSort(inputArray: &leftHalf)
    mergeSort(inputArray: &rightHalf)

    // Merge the sorted left and right halves back into the original array.
    merge(inputArray: &inputArray, leftHalf: leftHalf, rightHalf: rightHalf)
}

/// Merges the sorted arrays
func merge(inputArray: inout [Int], leftHalf: [Int], rightHalf: [Int]) {
    var leftIndex = 0
    var rightIndex = 0
    var mergedIndex = 0

    // Merge elements from left and right halves in sorted order.
    while leftIndex < leftHalf.count && rightIndex < rightHalf.count {
        if leftHalf[leftIndex] < rightHalf[rightIndex] {
            inputArray[mergedIndex] = leftHalf[leftIndex]
            leftIndex += 1
        } else {
            inputArray[mergedIndex] = rightHalf[rightIndex]
            rightIndex += 1
        }
        mergedIndex += 1
    }

    // Copy any remaining elements from the left half, if any.
    while leftIndex < leftHalf.count {
        inputArray[mergedIndex] = leftHalf[leftIndex]
        leftIndex += 1
        mergedIndex += 1
    }

    // Copy any remaining elements from the right half, if any.
    while rightIndex < rightHalf.count {
        inputArray[mergedIndex] = rightHalf[rightIndex]
        rightIndex += 1
        mergedIndex += 1
    }
}

// Extension to generate a random shuffled array of integers
public extension Array where Element == Int {
    static func generateRandom(size: Int) -> [Int] {
        guard size > 0 else {
            return []
        }
        return Array(0..<size).shuffled()
    }
}

// Generate a random array of integers and sort it using merge sort
var randomArray = Array.generateRandom(size: 100)
print("Original Array:")
print(randomArray)

mergeSort(inputArray: &randomArray)
print("Sorted Array:")
print(randomArray)
