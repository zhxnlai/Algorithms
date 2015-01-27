// Playground - noun: a place where people can play

import UIKit

func combinationSum(set: [Int], t: Int) -> [[Int]] {
    if set.count == 0 {
        return []
    }
    var uniqueSet = set.filter({e in contains(set, e)}).sorted(<)
    var result = [[Int]]()
    var path = [Int]()
    helper(set, t, 0, &path, &result)
    return result
}

func helper(set: [Int], gap: Int, from: Int, inout path: [Int], inout result: [[Int]]) {
    if gap == 0 {
        result.append(path)
        return
    }
    for i in from..<set.count {
        let e = set[i]
        if e<=gap {
            path.append(e)
            helper(set, gap-e, i, &path, &result)
            path.removeLast()
        }
    }
}

combinationSum([7], 7)
combinationSum([2,3,6,7], 7)
//combinationSum([2,3,6,7], 70)

/*
func combinationSum(set: [Int], t: Int) -> [[Int]] {
    if set.count == 0 {
        return []
    }
    var uniqueSet = set.filter({e in contains(set, e)}).sorted(<)
    var result = [[Int]]()
    var path = [Int]()
    helper(set, t, uniqueSet.last!, &path, &result)
    return result
}

func helper(set: [Int], t: Int, to: Int, inout path: [Int], inout result: [[Int]]) {
    let sum = path.reduce(0, combine: +)
    if sum == t {
        result.append(path.reverse())
    }
    for e in set {
        if e<=to && sum+e <= t {
            path.append(e)
            helper(set, t, e, &path, &result)
            path.removeLast()
        }
    }
}

combinationSum([7], 7)
combinationSum([2,3,6,7], 7)
*/



/*
Given a set of candidate numbers (C ) and a target number (T ), find all unique combinations in C where the candidate numbers sums to T .The same repeated number may be chosen from C unlimited number of times. Note:• All numbers (including target) will be positive integers.• Elements in a combination(a1,a2,...,ak) must be in non-descendingorder.(ie,a1 ≤a2 ≤...≤ak). • The solution set must not contain duplicate combinations.For example, given candidate set 2,3,6,7 and target 7, A solution set is:[7][2, 2, 3]
*/
