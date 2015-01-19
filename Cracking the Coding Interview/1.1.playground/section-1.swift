// Playground - noun: a place where people can play

import UIKit

func uniqueCharacters1(s: String) -> Bool {
    var dict = [Character: Int]()
    for c in s {
        if let charCount = dict[c] {
            dict[c] = charCount+1
            return false
        } else {
            dict[c] = 0
        }
    }
    return true
}

uniqueCharacters1("ss")
uniqueCharacters1("sadwqjvnladne")
uniqueCharacters1("afwvcxzgk,")

/*
Implement an algorithm to determine if a string has all unique characters. What if you can not use additional data structures?
*/