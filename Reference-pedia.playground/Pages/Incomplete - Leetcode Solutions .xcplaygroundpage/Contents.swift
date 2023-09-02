import UIKit

import Foundation
var text1 = "oxcpqrsvwf"
var text2 = "shmtulqrypy"

func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
       let m = text1.count
       let n = text2.count

       var dp = Array(repeating: Array(repeating: 0, count: n + 1), count: m + 1)

  print(dp)
       let text1Array = Array(text1)
       let text2Array = Array(text2)

       for i in 1...m {
           for j in 1...n {
               if text1Array[i - 1] == text2Array[j - 1] {
                   dp[i][j] = dp[i - 1][j - 1] + 1
               } else {
                   dp[i][j] = max(dp[i - 1][j], dp[i][j - 1])
               }
           }
       }
       return dp[m][n]

   }

print(longestCommonSubsequence(text1,text2))


let scores = ["ali", "veli", "vera","dera"]
let passCount = scores.filter {word in

  word.hasSuffix("li")}.count

print(passCount)

var mystr = "Bugatti"
print(mystr.hasPrefix("Bu"))
print(mystr.uppercased())
print(mystr.sorted())


var numberos = [1,2,3,4,5,6,7,8,9]

func equals (_ nums : [Int],_ target : Int) -> Bool{

  var numbersSeen = Set<Int>()

  for num in nums {
    if numbersSeen.contains(target - num) {
      return true
    }
    numbersSeen.insert(num)
  }

  return false
}

print(equals(numberos, 17))


var nums = [-11,7,3,2,1,7,-10,11,21,3]


func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
  var numbersSeen = [Int: Int]()  // Dictionary to store number and its index

          for (i, num) in nums.enumerated() {
            print(numbersSeen)
              let complement = target - num

              if let index = numbersSeen[complement] {
                  return [index, i]
              }

              numbersSeen[num] = i
          }

          return [0, 0]
  }

print (twoSum(nums, 11))


var numbers = [1,23,745,23475,343,786,43,6785,4234,678,54,534]

//var sortedNums = numbers.sorted {$0 < $1}
//
//print(sortedNums)


var index = 0

while index < numbers.count - 1 {
  for j in index+1..<numbers.count {
    if numbers[index] > numbers[j] {
        let temp = numbers[index]
        numbers[index] = numbers[j]
        numbers[j] = temp
    }
  }
  index += 1
}

print(numbers)




struct User  {
  var name = "test"
  var age = 0
}

var users: [User] = [
  User(name: "ali", age: 23),
  User(name: "veli", age: 34),
  User(name: "jack", age: 45),
  User(name: "mack", age: 90)
]


let ageSum = users.reduce(0) { partialResult, User in
  partialResult +  User.age
}

let ageSum2 = users.reduce(0,{ $0 + $1.age})

print(ageSum2)



var lolz = [1,nil,2,nil,5,nil,6,7]

print(lolz.compactMap({ int in
int
}).map{$0 * 2})



var test = lolz.enumerated().contains { index, num in
   lolz[index] == 2
}

print(test)


func sumOfIntegers(num: Int) -> Int {

  if num > 0 {
    return num + sumOfIntegers(num: num-1)
  } else {
    return 0
  }
}

print(sumOfIntegers(num: 2))


var myword = "0P"
func isPalindrome(s : String) -> Bool {

  var newWord: String = s.lowercased()
  newWord.removeAll {!$0.isNumber && !$0.isLetter }
  print(newWord)
  if newWord.count == 0 {return true}
  var remainder = newWord.count % 2
  var half = newWord.count/2
  var first = 0
  var last = newWord.count-1
  var stop = remainder != 0 ? half+1 : half
//  var arrayWord = Array(newWord)

  while (first <= stop && last >= stop) {
//    if arrayWord[first] != arrayWord[last] {
//      return false
//    }

    if newWord[newWord.index(newWord.startIndex, offsetBy: first)] != newWord[newWord.index(newWord.startIndex, offsetBy: last)]{
      return false
    }
    first+=1
    last-=1
  }

  return true
}

print(isPalindrome(s: myword))

var s = "aa"
var p = "bb"

func findAnagrams(_ s: String, _ p: String) -> [Int] {
    var ss = Array(s)
    var pp = Set(p)
     if (Set(ss).count == pp.count && pp.isSubset(of: ss)) {
        return [0]
      } else if (Set(ss).count == pp.count) {
        return []
      }
          var index = 0
          var ranges:[Int] = []
          while index <= ss.count-pp.count {
              print(pp)
              print(ss[index...(index+p.count-1)])
            if pp.isSubset(of:ss[index...(index+p.count-1)]) {
                ranges.append(index)
              }
              index+=1
          }
          return ranges
}
print(findAnagrams(s, p))

///Two sum
func twoSumPointers(array : [Int], sum : Int) -> Bool {

  if array.count == 0 {return false}
  var firstIndex = 0
  var lastIndex = array.count-1

  while firstIndex<lastIndex {
    let sumOfNumbers = array[firstIndex] + array[lastIndex]
    if sumOfNumbers == sum {
      return true
    } else if sumOfNumbers < sum {
      firstIndex+=1
    } else {
      lastIndex-=1
    }
  }
  return false

}

print(twoSumPointers(array: [1,2,3,4,5,6,7,8,9,10], sum: 19))

