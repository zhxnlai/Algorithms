// Playground - noun: a place where people can play

import UIKit

func plusOne(digits: [Int]) -> [Int] {
    var carry = 1
    var cur = digits.count-1
    var ret = [Int]()
    
    while cur>=0 {
        var digit = digits[cur]
        if digit+carry > 9 {
            digit = digit+carry-10
            carry = 1
        } else {
            digit += carry
            carry = 0
        }
        ret.insert(digit, atIndex: 0)
        cur--
    }
    
    if carry != 0 {
        ret.insert(carry, atIndex: 0)
        carry = 0
    }

    return ret
}

plusOne([1])
plusOne([1,2,3])
plusOne([9,2,3])
plusOne([9,9,9])


func plusOne2(digits: [Int]) -> [Int] {
    var carry = 1
    var cur = digits.count-1
    var ret = [Int]()
    
    while cur>=0 {
        var digit = digits[cur]
        digit += carry
        carry = digit/10
        digit %= 10
        ret.insert(digit, atIndex: 0)
        cur--
    }
    
    if carry != 0 {
        ret.insert(carry, atIndex: 0)
        carry = 0
    }
    
    return ret
}

plusOne2([1])
plusOne2([1,2,3])
plusOne2([9,2,3])
plusOne2([9,9,9])

/*
Given a number represented as an array of digits, plus one to the number.
*/
