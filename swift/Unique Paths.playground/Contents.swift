// Playground - noun: a place where people can play

import UIKit

func uniquePaths(m: Int, n: Int) -> Int {
    var count = 0
    helper(0, 0, m-1, n-1, &count)
    return count
}

func helper(toM: Int, toN: Int, m: Int, n: Int, inout result: Int) {
    if toM==m && toN==n {
        result += 1
    }
    if toM < m {
        helper(toM+1, toN, m, n, &result)
    }
    if toN < n {
        helper(toM, toN+1, m, n, &result)
    }
}

uniquePaths(1,1)
uniquePaths(2,2)
uniquePaths(3,3)
uniquePaths(3,7)

/*:
A robot is located at the top-left corner of a m × n grid (marked ’Start’ in the diagram below).The robot can only move either down or right at any point in time. The robot is trying to reach the bottom-right corner of the grid (marked ’Finish’ in the diagram below).How many possible unique paths are there?
*/