// Playground - noun: a place where people can play

import UIKit

func mergeSort<T: Comparable>(a: [T], b: [T]) -> [T] {
    var c = [T](), ai = 0, bi = 0
    while ai<a.count && bi<b.count {
        if a[ai]>b[bi] {
            c.append(b[bi])
            bi++
        } else {
            c.append(a[ai])
            ai++
        }
    }
    return ai==a.count ? c+b[bi..<b.count] : c+a[ai..<a.count]
}

mergeSort([1,2,3,4,5,6,6], [2,2,3,4,5])
mergeSort([1,2,3], [4,5])
mergeSort([1,2], [4,5,6])
mergeSort([4,5,6], [1,2])

/*
Given two sorted integer arrays A and B, merge B into A as one sorted array.Note: You may assume that A has enough space to hold additional elements from B. The number of elements initialized in A and B are m and n respectively.
*/