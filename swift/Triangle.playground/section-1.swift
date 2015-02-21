// Playground - noun: a place where people can play

import UIKit


func triangle(t: [[Int]]) -> Int {
    
    var opt = [[Int]](count: t.count, repeatedValue: [Int](count: t.count, repeatedValue: 0))
    opt[t.count-1] = t[t.count-1]
    for var i=t.count-2; i>=0; i-- {
        for var j=0; j<t[i].count; j++ {
            opt[i][j] = min(opt[i+1][j], opt[i+1][j+1])+t[i][j]
        }
    }
    return opt[0][0]
}

triangle([    [2],    [3,4],    [6,5,7],    [4,1,8,3]    ])

/*
Given a triangle, find the minimum path sum from top to bottom. Each step you may move to adjacent numbers on the row below.For example, given the following triangle[[2],[3,4],[6,5,7],[4,1,8,3]]The minimum path sum from top to bottom is 11 (i.e., 2 + 3 + 5 + 1 = 11).Note: Bonus point if you are able to do this using only O(n) extra space, where n is the total number ofrows in the triangle.
*/