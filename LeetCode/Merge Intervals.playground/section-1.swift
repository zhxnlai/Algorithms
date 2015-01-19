// Playground - noun: a place where people can play

import UIKit

func mergeIntervals(intervals: [[Int]]) -> [[Int]] {
    var ret = [[Int]]()
    for interval in intervals {
        ret = insertAndMerge(ret, interval)
    }
    
    return ret
}

func insertAndMerge(a: [[Int]], insert: [Int]) -> [[Int]] {
    func isOverlapping(a: [Int])(b: [Int]) -> Bool {
        return a[0] <= b[1] && a[1] >= b[0]
    }
    
    func merge(a: [Int], b: [Int]) -> [Int] {
        return [min(a[0], b[0]), max(a[1], b[1])]
    }
    
    var overlappingIntervals = a.filter(isOverlapping(insert))
    var mergedIntervals = overlappingIntervals.reduce(insert, combine: merge)
    
    var b = a.filter({x in !isOverlapping(insert)(b: x)})
    b.append(mergedIntervals)
    return b
}

mergeIntervals([[1,3],[2,6],[8,10],[15,18]])

/*
Given a collection of intervals, merge all overlapping intervals.For example, Given [1,3],[2,6],[8,10],[15,18], return [1,6],[8,10],[15,18]
*/
