// Playground - noun: a place where people can play

import UIKit


/*
The set [1,2,3,⋯,n] contains a total of n! unique permutations.By listing and labeling all of the permutations in order, We get the following sequence (ie, for n = 3):"123""132""213""231""312""321"Given n and k, return the kth permutation sequence. Note: Given n will be between 1 and 9 inclusive.
*/

/*

1,2,3,4
1,2,4,3
1,3,2,4
1,3,4,2
1,4,2,3
1,4,3,2


1, 2, 6, 24...


1,4,3,2
0,3,2,1 -> 0*6+3*2+1


sort digits,
n=4, k=6
nn = [1,2,3,4]
m = [1,2,6,24]

k1 = k

a1 = k(nFact[n-1])
k2 = k%(nFact[n-1])

a2 = k2/(nFact[n-2])
...

3, 6
nn = [1,2,3]
nFact = [1,1,2,6]

k1 = 6

a1 = 6/2 = 3
k2 = 6%2 = 0

a2 = 0/1 = 0
ak = 0%1 = 0




*/

func kthPermutationSequence(n:Int, k:Int) -> [Int] {
    var nFact = [1]
    for index in 1...n {
        nFact.append(index*(nFact[index-1]))
    }
    nFact
    var m = [Int]()
    for index in 1...n {
        m.append(index)
    }
    m

    var sequence = [Int]()
    var d = k
    for var i=n-1; i>0; i-- {
        var f = nFact[i+1]
        var a = d/f
        println("m before: \(m), a: \(a), d: \(d), nfact: \(f)")

        sequence.append(m[a])
        m.removeAtIndex(a)
        println("m after: \(m)")
        d = d%(f)
        
    }
    sequence.append(m.first!)

    return sequence
}

kthPermutationSequence(3, 6)
