// Playground - noun: a place where people can play

import UIKit

func singleNumber(a: [Int]) -> Int {
    return a.reduce(0, combine: ^)
}

singleNumber([1,1,2])
singleNumber([1,1,3,2,4,3,4])

/*
Given an array of integers, every element appears twice except for one. Find that single one.Note: Your algorithm should have a linear runtime complexity. Could you implement it without using extra memory?
*/