//: [Previous](@previous)

import Foundation

/// Binary search
extension RandomAccessCollection where Element: Comparable {
    /// Binary search iteration
    private func binarySearchIteration(forIndexOf value: Element, in range: Range<Index>? = nil,
                                       valueDetected: ((Index, _ in: Range<Index>) -> Index?)) -> Index? {
        // Define the range to search within, defaulting to the entire collection
        let range = range ?? startIndex..<endIndex

        // Check if the range is empty or invalid; if so, return nil
        guard range.lowerBound < range.upperBound else { return nil }

        // Calculate the size of the current search range
        let size = distance(from: range.lowerBound, to: range.upperBound)

        // Calculate the middle index of the current range
        let middle = index(range.lowerBound, offsetBy: size / 2)

        // Check the element at the middle index
        switch self[middle] {
        case value: return valueDetected(middle, range) ?? middle // Value detected, return the result from the closure or middle index
        case ..<value: return binarySearch(forIndexOf: value, in: index(after: middle)..<range.upperBound) // Recurse on the right half
        default: return binarySearch(forIndexOf: value, in: range.lowerBound..<middle) // Recurse on the left half
        }
    }

    // Public function for performing a binary search to find an index
    func binarySearch(forIndexOf value: Element, in range: Range<Index>? = nil) -> Index? {
        // Call the binarySearchIteration with a closure that returns the current index
        binarySearchIteration(forIndexOf: value, in: range) { currentIndex, _ in currentIndex }
    } 

    // Public function for performing a binary search to find the first index
    func binarySearch(forFirstIndexOf value: Element, in range: Range<Index>? = nil) -> Index? {
        // Call the binarySearchIteration with a closure that searches on the left half
        binarySearchIteration(forIndexOf: value, in: range) { currentIndex, range in
            binarySearch(forFirstIndexOf: value, in: range.lowerBound..<currentIndex)
        }
    }

    // Public function for performing a binary search to find the last index
    func binarySearch(forLastIndexOf value: Element, in range: Range<Index>? = nil) -> Index? {
        // Call the binarySearchIteration with a closure that searches on the right half
        binarySearchIteration(forIndexOf: value, in: range) { currentIndex, range in
            binarySearch(forFirstIndexOf: value, in: index(after: currentIndex)..<range.upperBound)
        }
    }

    // Public function for performing a binary search to find a range of indices
    func binarySearch(forIndicesRangeOf value: Element, in range: Range<Index>? = nil) -> Range<Index>? {
        // Define the range to search within, defaulting to the entire collection
        let range = range ?? startIndex..<endIndex

        // Check if the range is empty or invalid; if so, return nil
        guard range.lowerBound < range.upperBound else { return nil }

        // Perform a binary search to find the first index
        guard let currentIndex = binarySearchIteration(forIndexOf: value, in: range, valueDetected: { index, _ in index }) else { return nil }

        // Search for the first and last indices to form a range
        let firstIndex = binarySearch(forFirstIndexOf: value, in: range.lowerBound ..< index(after: currentIndex)) ?? currentIndex
        let lastIndex = binarySearch(forFirstIndexOf: value, in: index(after: currentIndex) ..< range.upperBound) ?? currentIndex

        return firstIndex..<index(after: lastIndex)
    }
}


//let array = ["one", "two", "three", "three", "three", "three", "three", "four", "five", "five"]
//let value = "three"
let array = [1, 2, 3, 3, 3, 3, 3, 4, 5, 5]
let value = 3
print(array.binarySearch(forFirstIndexOf: value) ?? 0)
print(array.binarySearch(forLastIndexOf: value) ?? 0)
print(array.binarySearch(forIndicesRangeOf: value) ?? 0)

