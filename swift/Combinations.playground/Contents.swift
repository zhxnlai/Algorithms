// Playground - noun: a place where people can play

import UIKit

func combinations(n: Int, k: Int) -> [[Int]] {
    var result = [[Int]]()
    var path = [Int]()
    helper(n+1, k, 1, &path, &result)
    return result
}

func helper(n: Int, k: Int, from: Int, inout path: [Int], inout result: [[Int]]) {
    if k==path.count {
        result.append(path)
    } else {
        for i in (from..<n) {
            path.append(i)
            helper(n, k, i+1, &path, &result)
            path.removeLast()
        }
    }
}

combinations(4, 2)

/*:
Given two integers n and k, return all possible combinations of k numbers out of 1...n. For example, If n = 4 and k = 2, a solution is:
[
[2,4],
[3,4],
[2,3],
[1,2],
[1,3],
[1,4],
]
*/