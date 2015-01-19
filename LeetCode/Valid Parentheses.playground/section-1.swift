// Playground - noun: a place where people can play

import UIKit

extension String {
    func contains(c: Character) -> Bool {
        for cc in self {
            if cc == c {
                return true
            }
        }
        return false
    }
    func indexOf(c: Character) -> Int {
        for i in 0..<countElements(self) {
            let cc = Array(self)[i]
            if cc == c {
                return i
            }
        }
        return -1
    }
}

func validParentheses(s: String) -> Bool {
    let left = "({["
    let right = ")}]"
    
    var stack = [Character]()
    
    for c in s {
        if left.contains(c) {
            stack.append(c)
        } else if right.contains(c) {
            if stack.count>0 {
                let leftC = stack.removeLast()
                if left.indexOf(leftC) != right.indexOf(c) {
                    return false
                }
            } else {
                return false
            }
        }
    }
    return true
}

validParentheses("]")
validParentheses("([)]")
validParentheses("()[]{}")
validParentheses("()[d(]{}")

/*
Given a string containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.

The brackets must close in the correct order, "()" and "()[]{}" are all valid but "(]" and "([)]" are not.
*/
