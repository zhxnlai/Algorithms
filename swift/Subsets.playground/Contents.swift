// Playground - noun: a place where people can play

import UIKit


//func subsets(s: [Int]) -> [[Int]] {
//    var ret = [[Int]]()
//    for from in 0..<s.count {
//        for to in from..<s.count {
//            ret.append([Int](s[from...to]))
//        }
//    }
//    return ret
//}
//
//subsets([1,2,3])

func subsets2(s: [Int]) -> [[Int]] {
    var ret = [[Int]]()
    var path = [Int]()
    helper(s, 0, &path, &ret)
    return ret
}

func helper(s: [Int], from: Int, inout path: [Int], inout result: [[Int]]) {
    if from == s.count {
        result.append(path)
    } else {
        path.append(s[from])
        helper(s, from+1, &path, &result)
        path.removeLast()
        
        helper(s, from+1, &path, &result)
    }
}

subsets2([1,2,3])

/*:
Given a set of distinct integers, S, return all possible subsets. 
Note:
• Elements in a subset must be in non-descending order.
• The solution set must not contain duplicate subsets.
For example, If S = [1,2,3], a solution is:

[
[3],
[1],
[2],
[1,2,3],
[1,3],
[2,3],
[1,2],
[]
]
*/