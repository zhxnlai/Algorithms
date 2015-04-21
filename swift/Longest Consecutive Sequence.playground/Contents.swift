// Playground - noun: a place where people can play

import UIKit

/*
Given an unsorted array of integers, find the length of the longest consecutive elements sequence.For example, Given [100, 4, 200, 1, 3, 2], The longest consecutive elements sequence is [1, 2, 3, 4]. Return its length: 4.Your algorithm should run in O(n) complexity.

*/

func longestConsecutiveSequence(a:[Int]) -> Int {
    var dict = [Int: Bool]()
    
    for e in a {
        dict[e] = false
    }
    
    var longest = 0
    
    for e in a {
        if let visited = dict[e] {
            if visited {
                continue
            }
        }
        
        var l = 1
        dict[e] = true
        
        for var i = e+1; dict[i] != nil; i++ {
            l++
            dict[i] = true
        }
        
        for var i = e-1; dict[i] != nil; i-- {
            l++
            dict[i] = true
        }

        longest = max(longest, l)
    }
    
    return longest
}

longestConsecutiveSequence([1, 2, 3, 4])
longestConsecutiveSequence([100, 4, 200, 1, 3, 2])
