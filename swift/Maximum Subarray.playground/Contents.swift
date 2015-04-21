// Playground - noun: a place where people can play

import UIKit


func maximumSubarray(a: [Int]) -> [Int]{
    var sum = [[Int]](count: a.count, repeatedValue: [Int](count: a.count, repeatedValue: 0))
    for var from=0; from<a.count; from++ {
        sum[from][from] = a[from]
        for var to=from+1; to<a.count; to++ {
            sum[from][to] = sum[from][to-1]+a[to]
        }
    }
    
    var maxSum = 0, maxRange = (0,0)
    for var from=0; from<a.count; from++ {
        for var to=from; to<a.count; to++ {
            if maxSum < sum[from][to] {
                maxSum = sum[from][to]
                maxRange = (from, to)
            }
        }
    }
    
    let (min, max) = maxRange
    return [Int](a[min...max])
}

maximumSubarray([-2,1,-3,4,-1,2,1,-5,4])


func maximumSubarraySum(a: [Int]) -> Int {
    let (result, ff) = a.reduce((0,0), combine: { (t, e) -> (Int, Int) in
        let (r, f) = t,
        newF = max(e, f+e),
        newR = max(r, newF)
        return (newR, newF)
    })
    return result
}

maximumSubarraySum([-2,1,-3,4,-1,2,1,-5,4])


/*:
Find the contiguous subarray within an array (containing at least one number) which has the largest sum.For example, given the array [-2,1,-3,4,-1,2,1,-5,4], the contiguous subarray [4,-1,2,1] has the largest sum = 6.
*/