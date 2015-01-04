// Playground - noun: a place where people can play

import UIKit

/*
Given a sorted array, remove the duplicates in place such that each element appear only once and return the new length.Do not allocate extra space for another array, you must do this in place with constant memory.For example, Given input array A = [1,1,2],Your function should return length = 2, and A is now [1,2].
*/

func removeDuplicates(a: [Int]) -> [Int] {
    var index = 0, array = [Int](a)
    
    for var i=0; i<array.count; i++ {
        if (array[i] != array[index]) {
            index++
            array[index] = array[i]
        }
    }

    return [Int](array[0...index])
}

func removeDuplicates0(a: [Int]) -> [Int] {
    var index = 0, array = [Int](a)
    
    for var i=1; i<array.count; i++ {
        if (array[i] != array[i-1]) {
            index++
            array[index] = array[i]

        }
    }
    
    return [Int](array[0...index])
}


var A = [1,1,2]
removeDuplicates(A)
removeDuplicates0(A)

var B = [1,1,2,4,5,6,6,6,6,7,8,9,55]
removeDuplicates(B)
removeDuplicates0(B)

/*
Follow up for ”Remove Duplicates”: What if duplicates are allowed at most twice? For example, Given sorted array A = [1,1,1,2,2,3],Your function should return length = 5, and A is now [1,1,2,2,3]
*/


func removeDuplicates2(a: [Int]) -> [Int] {
    var index = 0, array = [Int](a)
    
    for var i=1; i<array.count-1; i++ {
        if (!(array[i] == array[i-1] && array[i] == array[i+1])) {
            index++

            array[index] = array[i]
        }
    }

    return [Int](array[0...index])
}

var A2 = [1,1,1,2,2,3]
removeDuplicates2(A2)

var B2 = [1,1,1,1,2,2,2,3,3]
removeDuplicates2(B2)

/*
Follow up for ”Remove Duplicates”: What if duplicates are allowed at most three times?
*/

func removeDuplicates3(a: [Int]) -> [Int] {
    var index = 0, array = [Int](a)
    
    for var i=1; i<array.count-2; i++ {
    if (!(array[i] == array[i+2] && array[i] == array[i-1]  && array[i] == array[i+1])) {
    index++
    
    array[index] = array[i]
    }
    }
    
    return [Int](array[0...index])
}

var B3 = [1,1,1,1,2,2,2,2,3,3,3,3,3,3,3]
removeDuplicates3(B3)


