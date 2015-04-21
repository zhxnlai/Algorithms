// Playground - noun: a place where people can play

import UIKit

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

insertAndMerge([[1,3],[6,9]], [2,5])
insertAndMerge([[1,2],[3,5],[6,7],[8,10],[12,16]], [4,9])

/*:
Given a set of non-overlapping intervals, insert a new interval into the intervals (merge if necessary). You may assume that the intervals were initially sorted according to their start times.Example 1: Given intervals [1,3],[6,9], insert and merge [2,5] in as [1,5],[6,9].Example 2: Given [1,2],[3,5],[6,7],[8,10],[12,16], insert and merge [4,9] in as[1,2],[3,10],[12,16].This is because the new interval [4,9] overlaps with [3,5],[6,7],[8,10].
*/