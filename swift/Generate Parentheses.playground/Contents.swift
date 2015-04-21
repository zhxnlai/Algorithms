// Playground - noun: a place where people can play

import UIKit

func generateParentheses(n: Int) -> [String] {
    var result = [String]()
    var path = [String]()
    helper(n, 0, 0, &path, &result)
    return result
}

func helper(n: Int, numLeft: Int, numRight: Int, inout path: [String], inout result: [String]) {
    if numLeft == n && numRight == n {
        result.append("".join(path))
    } else {
        path
        if numLeft < n {
            path.append("(")
            helper(n, numLeft+1, numRight, &path, &result)
            path.removeLast()
        }
        if numRight < n && numRight < numLeft {
            path.append(")")
            helper(n, numLeft, numRight+1, &path, &result)
            path.removeLast()
        }
    }
}

generateParentheses(3)

/*Given n pairs of parentheses, write a function to generate all combinations of well-formed parentheses.For example, given n = 3, a solution set is:"((()))", "(()())", "(())()", "()(())", "()()()"
*/
