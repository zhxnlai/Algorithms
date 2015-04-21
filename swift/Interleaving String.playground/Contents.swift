// Playground - noun: a place where people can play

import UIKit

extension String {
    subscript (i: Int) -> String {
        return String(Array(self)[i])
    }
    subscript (r: Range<Int>) -> String {
        return String(Array(self)[r])
    }
}

func isInterleave(s1: String, s2: String, s3: String) -> Bool {
    let strlen1 = count(s1),
    strlen2 = count(s2),
    strlen3 = count(s3)
    if strlen3 != strlen1+strlen2 {
        return false
    }
    if strlen1 == 0 || strlen2 == 0 {
        return true
    }
    
    var opt = [[Bool]](count: strlen1, repeatedValue: [Bool](count: strlen2, repeatedValue: false))
    
    for var i=0; i<strlen1; i++ {
        for var j=0; j<strlen2; j++ {
            opt[i][j] = (i==0 ? true : opt[i-1][j]) && s1[i] == s3[i+j+1] ||
                        (j==0 ? true : opt[i][j-1]) && s2[j] == s3[i+j+1]
//            println("s1[\(i)]: \(s1[i]) s2[\(j)]: \(s2[j]) s3[\(i+j+1)]: \(s3[i+j+1]) opt[\(i)][\(j)]: \(opt[1][j])")

        }
    }
    
    return opt.last!.last!
}

isInterleave("aabcc", "dbbca", "aadbbcbcac")
isInterleave("aabcc", "dbbca", "aadbbbaccc")
isInterleave("101", "011", "011011")
isInterleave("101", "011", "110110")

// aadbbcbcac
// aa  bc   c
//   db  bca
//0,0, 1,0, 1,1, 2,1, 3,1, 3,2 3,3, 3,4, 4,4
/*
Given s1, s2, s3, find whether s3 is formed by the interleaving of s1 and s2. For example, Given: s1 = ”aabcc”, s2 = ”dbbca”,When s3 = ”aadbbcbcac”, return true.When s3 = ”aadbbbaccc”, return false.
*/
