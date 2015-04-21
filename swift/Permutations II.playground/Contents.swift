// Playground - noun: a place where people can play

import UIKit

func permutations(s: [Int]) -> [[Int]] {
    var path = [Int]()
    var result = [[Int]]()
    helper(s.sorted(<), &path, &result)
    return result
}

func helper(s: [Int], inout path: [Int], inout result: [[Int]]) {
    if s.count == 0 {
        result.append(path)
    } else {
        for i in 0..<s.count {
            if i>0 && s[i] == s[i-1] {
                continue
            }
            let e = s[i]
            path.append(e)
            var newS = [Int](s)
            newS.removeAtIndex(i)
            helper(newS, &path, &result)
            path.removeLast()
        }
    }
}

permutations([1,1,2])


/*
Given a collection of numbers that might contain duplicates, return all possible unique permutations.

For example,
[1,1,2] have the following unique permutations:
[1,1,2], [1,2,1], and [2,1,1].
*/
