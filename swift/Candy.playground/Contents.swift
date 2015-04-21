// Playground - noun: a place where people can play

import UIKit

// not tested
func minimunCandies(ratings: [Int]) -> Int {
    var increment = [Int]()
    
    var inc = 1
    for i in 1..<ratings.count {
        if ratings[i]>ratings[i-1] {
            increment[i] = max(inc++, increment[i])
        } else {
            inc = 1
        }
    }
    inc = 1
    for i in 2..<ratings.count {
        var i = ratings.count-i
        if ratings[i]>ratings[i+1] {
            increment[i] = max(inc++, increment[i])
        } else {
            inc = 1
        }
    }
    return increment.reduce(0, combine: +)
}

/*:
There are N children standing in a line. Each child is assigned a rating value.
You are giving candies to these children subjected to the following requirements: 
• Each child must have at least one candy.• Children with a higher rating get more candies than their neighbors.What is the minimum candies you must give?
*/