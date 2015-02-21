// Playground - noun: a place where people can play

import UIKit

extension String {
    subscript (i: Int) -> String {
        return String(Array(self)[i])
    }
    subscript (r: Range<Int>) -> String {
        return String(Array(self)[r])
    }
}

func isPalindrome(s: String) -> Bool {
    return s == String(Array(s).reverse())
}

func palindromePartition(s: String) -> [[String]] {
    var path = [String]()
    var result = [[String]]()
    helper(s, countElements(s), &path, &result)
    return result
}

func helper(s: String, to: Int, inout path: [String], inout result: [[String]]) {
    if to == 0 {
        result.append(path.reverse())
    }
    for var from=0; from<to; from++ {
        var subStr = s[from..<to]
        if isPalindrome(subStr) {
            path.append(subStr)
            helper(s, from, &path, &result)
            path.removeLast()
        }
    }
}

palindromePartition("a")
palindromePartition("aa")
palindromePartition("aab")
palindromePartition("aabc")

/*
Given a string s, partition s such that every substring of the partition is a palindrome. Return all possible palindrome partitioning of s.For example, given s = ”aab”, Return[["aa","b"],["a","a","b"]]
*/
