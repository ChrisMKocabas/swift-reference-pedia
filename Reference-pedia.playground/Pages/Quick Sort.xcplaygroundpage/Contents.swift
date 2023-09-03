import Foundation

/// Convenience function to initiate quicksort with only array
func quicksort(for array: inout [Int]) {
  quicksort(for: &array, lowIndex: 0, highIndex: (array.count - 1))
}

/// Main quicksort function that sorts a specific range of the array
func quicksort(for array: inout [Int], lowIndex: Int, highIndex: Int) {

  // Base case: If the range contains zero or one element, it's already sorted
  if lowIndex >= highIndex {
    return
  }

  // Randomly select a pivot index within the range
  let pivotIndex = Int.random(in: lowIndex..<highIndex)

  // Move the pivot element to the end of the range
  swap(in: &array, index1: pivotIndex, index2: highIndex)

  // Initialize variables for the pivot element and pointers to partition the range
  let pivot = array[highIndex]
  var leftPointer = lowIndex
  var rightPointer = highIndex

  // Partition the range by moving elements smaller than the pivot to the left
  // and elements greater than the pivot to the right
  while leftPointer < rightPointer {
    // Find an element on the left side that is greater than the pivot
    while array[leftPointer] <= pivot && leftPointer < rightPointer {
      leftPointer += 1
    }
    // Find an element on the right side that is smaller than the pivot
    while array[rightPointer] >= pivot && leftPointer < rightPointer {
      rightPointer -= 1
    }
    // Swap the elements if the left element is greater and the right element is smaller
    if leftPointer < rightPointer {
      swap(in: &array, index1: leftPointer, index2: rightPointer)
    }
  }

  // Move the pivot element to its correct position in the sorted array
  swap(in: &array, index1: leftPointer, index2: highIndex)

  // Recursively sort the two subarrays on the left and right of the pivot
  quicksort(for: &array, lowIndex: lowIndex, highIndex: leftPointer - 1)
  quicksort(for: &array, lowIndex: leftPointer + 1, highIndex: highIndex)
}

// Utility function to swap two elements in an array
func swap(in array: inout [Int], index1: Int, index2: Int) {
  let temp = array[index1]
  array[index1] = array[index2]
  array[index2] = temp
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

// Generate a random array of integers and sort it using quicksort
var randomArray = Array.generateRandom(size: 100)
print("Original Array:")
print(randomArray)

quicksort(for: &randomArray)
print("Sorted Array:")
print(randomArray)
