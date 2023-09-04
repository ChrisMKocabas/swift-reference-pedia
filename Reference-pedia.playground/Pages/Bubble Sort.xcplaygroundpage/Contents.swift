//: [Previous](@previous)

import Foundation

// Function to perform bubble sort on an array of integers in-place
func bubbleSort(for array: inout [Int]) {
    var maxIndex: Int = array.count - 1
    var tick: Bool = true

    // Continue looping until no more swaps are needed
    while tick {
        tick = false
        for pointer in 0..<maxIndex {
            // Compare adjacent elements and swap if necessary
            if array[pointer] > array[pointer + 1] {
                (array[pointer], array[pointer + 1]) = (array[pointer + 1], array[pointer])
                tick = true // Set tick to true to indicate a swap occurred
            }
        }
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

// Generate a random array of integers and sort it using bubble sort
var randomArray = Array.generateRandom(size: 100)
print("Original Array:")
print(randomArray)

bubbleSort(for: &randomArray) // Call bubbleSort to sort the array in-place
print("Sorted Array:")
print(randomArray) // Print the sorted array
