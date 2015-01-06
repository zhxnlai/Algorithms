// Playground - noun: a place where people can play

import UIKit

func permutations(s: [Int]) -> [[Int]] {
    var path = [Int]()
    var result = [[Int]]()
    helper(s, &path, &result)
    return result
}

func helper(s: [Int], inout path: [Int], inout result: [[Int]]) {
    if s.count == 0 {
        result.append(path)
    } else {
        for i in 0..<s.count {
            let e = s[i]
            path.append(e)
            var newS = [Int](s)
            newS.removeAtIndex(i)
            helper(newS, &path, &result)
            path.removeLast()
        }
    }
}

permutations([1,2,3])

/*
Given a collection of numbers, return all possible permutations.
For example,
[1,2,3] have the following permutations:
[1,2,3], [1,3,2], [2,1,3], [2,3,1], [3,1,2], and [3,2,1].
*/