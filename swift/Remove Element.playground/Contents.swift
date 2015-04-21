// Playground - noun: a place where people can play

import UIKit

/*:
Given an array and a value, remove all instances of that value in place and return the new length. The order of elements can be changed. It doesn’t matter what you leave beyond the new length.
*/

var A = [1,2,2,2,3,4,5,5,6,7]

func removeElement(a:[Int], e:Int) -> [Int] {
    var index = 0, r = [Int](a)
    for var i=0; i<r.count; i++ {
        if r[i] != e {
            r[index] = r[i]
            index++

        }
    }
    return [Int](r[0..<index])
}


removeElement(A, 5)
removeElement(A, 1)
removeElement(A, 2)
