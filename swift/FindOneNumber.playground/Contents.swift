// Playground - noun: a place where people can play

import UIKit


func findOneNumber(a: [Int]) -> Int {
    var c = a[0]
    var t = 1
    for i in a[1..<a.count] {
        if t == 0 {
            c = i
            t = 1
        } else {
            if c == i {
                t++
            } else {
                t--
            }
        }

    }
    return c
}


findOneNumber([1,2,1,2,1])
findOneNumber([0,1,2,1,1])
findOneNumber([5,5,5,5,1])
