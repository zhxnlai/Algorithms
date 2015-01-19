// Playground - noun: a place where people can play

import UIKit


func trappingRainWater(heights: [Int]) -> Int {
    var maxLeft = [Int](count: heights.count, repeatedValue: 0)
    var maxRight = [Int](count: heights.count, repeatedValue: 0)

    for i in 1..<heights.count {
        maxLeft[i] = max(heights[i-1], maxLeft[i-1])
        maxRight[heights.count-1-i] = max(heights[heights.count-i], maxLeft[heights.count-i])
    }
    
    var sum = 0
    for i in 0..<heights.count {
        var waterHeight = min(maxLeft[i], maxRight[i])
        if waterHeight>heights[i] {
            sum += waterHeight-heights[i]
        }
    }
    
    return sum
}

trappingRainWater([0,1,0,2,1,0,1,3,2,1,2,1])

func trappingRainWater2(heights: [Int]) -> Int {

    var maxHeightIndex = 0
    var maxHeight = 0
    for i in 0..<heights.count {
        let h = heights[i]
        if h>maxHeight {
            maxHeight = h
            maxHeightIndex = i
        }
    }
    
    var sum = 0
    var peakLeft = 0
    for i in 0..<maxHeightIndex {
        let h = heights[i]
        if h>peakLeft {
            peakLeft = h
        } else {
            sum += peakLeft-h
        }
    }
    
    var peakRight = 0
    for var i = heights.count-1; i>=maxHeightIndex; i-- {
        let h = heights[i]
        if h>peakRight {
            peakRight = h
        } else {
            sum += peakRight-h
        }
    }
    return sum
}

trappingRainWater2([0,1,0,2,1,0,1,3,2,1,2,1])


/*
Given n non-negative integers representing an elevation map where the width of each bar is 1, compute how much water it is able to trap after raining.

For example,
Given [0,1,0,2,1,0,1,3,2,1,2,1], return 6.
*/