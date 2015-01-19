
// Playground - noun: a place where people can play

import UIKit

func subsets(s: [Int]) -> [[Int]] {
    var ret = [[Int]]()
    var path = [Int]()
    helper(s.sorted(<), 0, &path, &ret)
    return ret
}

func helper(s: [Int], from: Int, inout path: [Int], inout result: [[Int]]) {
    result.append(path)

    println(path)

    for i in from..<s.count {
        println("i: \(i) path: \(path)")

        if i != from && s[i] == s[i-1] {
            println("c \(path) \(s[i])")

            continue
        }
        path.append(s[i])
        helper(s, i+1, &path, &result)
        path.removeLast()

    }
        
}

//subsets([1,2,2])
subsets([1,1,2,2])

/*
Given a collection of integers that might contain duplicates, S, return all possible subsets.
Note:
Elements in a subset must be in non-descending order. The solution set must not contain duplicate
subsets. For example, If S = [1,2,2], a solution is:

[
[2],
[1],
[1,2,2],
[2,2],
[1,2],
[]
]
*/