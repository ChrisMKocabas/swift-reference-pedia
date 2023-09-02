//: [Previous](@previous)

import Foundation

/// This class implements a binary tree and some of the regularly used BT methods
class Node {
  public var val : Int
  public var left: Node?
  public var right: Node?

  ///Initializes binary tree with 0 as starting node
  public init(){
    self.val = 0; self.left  = nil; self.right = nil
  }

  ///Initializes binary tree with root node of choice
  public init (_ val : Int){
    self.val = val; self.left = nil; self.right = nil
  }

  ///Initializes binary tree with root note and its child nodes
  public init (_ val : Int, _ left : Node?, _ right: Node?) {
    self.val = val; self.left = left; self.right = right
  }

  /// Inserts a child node to the binary tree
  func insert(_ value : Int) -> () {
    if (value <= val) {
      if (left == nil) {
        left = Node(value)
      } else {
        left?.insert(value)
      }
    } else {
        if (right == nil) {
          right = Node(value)
        } else {
          right?.insert(value)
        }
      }
  }
  /// Searches for a child node in binary tree
  func contains(_ value : Int) -> Bool {
    if value == val {
      return true
    } else if value <= val {
      if (left == nil) {
        return false
      } else {
        return ((left?.contains(value)) != nil)
      }
    }else {
        if (right == nil ) {
          return false
        } else {
          return ((right?.contains(value)) != nil)
        }
      }
    }
  ///Returns an array of tree nodes in order : left (small) -> root -> right (big)
  func printInOrder(_ array : [Int] = [] ) -> [Int] {
    var nodesArray : [Int] = array
    if let leftNode = left {
      nodesArray.append(contentsOf: leftNode.printInOrder())
    }
    nodesArray.append(val)
//    print(val, terminator: " ")
    if let rightNode = right {
      nodesArray.append(contentsOf: rightNode.printInOrder())
    }
    return nodesArray
  }

  ///Returns an array of tree nodes in following order : root -> left (small) -> right (big)
  func printPreOrdered(_ array : [Int] = [] ) -> [Int]  {
    var nodesArray : [Int] = array
    nodesArray.append(val)
//    print(val, terminator: " ")
    if let leftNode = left {
      nodesArray.append(contentsOf: leftNode.printInOrder())
    }
    if let rightNode = right {
      nodesArray.append(contentsOf: rightNode.printInOrder())
    }
    return nodesArray
  }

  ///Returns an array of tree nodes in following order : left (small) -> right (big) -> root
  func printPostOrdered(_ array : [Int] = [] ) -> [Int] {
    var nodesArray : [Int] = []
    if let leftNode = left {
      nodesArray.append(contentsOf: leftNode.printInOrder())
    }
    if let rightNode = right {
      nodesArray.append(contentsOf: rightNode.printInOrder())
    }
    nodesArray.append(val)
//    print(val, terminator: " ")
    return nodesArray
  }

}

//Define a root node
let rootNode = Node(10)
// Sample array of values to insert
let valuesToInsert = [5, 15, 3, 7, 12, 18]

// Insert values from the array into the binary tree
for value in valuesToInsert {
    rootNode.insert(value)
}

print("Root node contains value: \(rootNode.contains(15))")

// Call the printInOrder() method on the root node to print all values in order
print(rootNode.printInOrder())
print(rootNode.printPreOrdered())
print(rootNode.printPostOrdered())
