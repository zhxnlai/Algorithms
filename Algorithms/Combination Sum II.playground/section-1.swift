// Playground - noun: a place where people can play

import UIKit

func combinationSum(set: [Int], t: Int) -> [[Int]] {
    if set.count == 0 {
        return []
    }
    var uniqueSet = set.filter({e in contains(set, e)}).sorted(<)
    var result = [[Int]]()
    var path = [Int]()
    helper(set, t, uniqueSet.last!, &path, &result)
    return result.reduce([[Int]](), combine: {acc, e in
        var unique = true
        for ee in acc {
            if e==ee {
                unique = false
            }
        }
        if unique {
            return acc+[e]
        } else {
            return acc
        }
    })
}

func helper(set: [Int], t: Int, to: Int, inout path: [Int], inout result: [[Int]]) {
    let sum = path.reduce(0, combine: +)
    if sum==t {
        result.append(path.reverse())
    } else {
        for i in 0..<set.count {
            let n = set[i]
            if n<=to && sum+n <= t {
                var setCopy = [Int](set)
                setCopy.removeAtIndex(i)
                path.append(n)
                helper(setCopy, t, n, &path, &result)
                path.removeLast()
            }
        }
    }
}

combinationSum([10,1,2,7,6,1,5], 8)

/*
Given a set of candidate numbers (C ) and a target number (T ), find all unique combinations in C where the candidate numbers sums to T .The same repeated number may be chosen from C once number of times. Note:• All numbers (including target) will be positive integers.
• Elements in a combination(a1,a2,...,ak) must be in non-descending order.(ie,a1 >a2 >...>ak).• The solution set must not contain duplicate combinations.For example, given candidate set 10,1,2,7,6,1,5 and target 8, A solution set is: 
[1, 7][1, 2, 5][2, 6][1, 1, 6]
*/
