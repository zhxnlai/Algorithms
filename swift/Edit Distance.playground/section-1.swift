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

func editDistance(start: String, end: String) -> Int {
    let strlenS = countElements(start), strlenE = countElements(end)
    var f = [[Int]](count: strlenS, repeatedValue: [Int](count: strlenE, repeatedValue: 0))
    
    for i in 0..<strlenS {
        for j in 0..<strlenE {
            if start[i] == end[j] {
                if i==0 && j==0 {
                    f[i][j] = 0
                } else if i==0 || j==0 {
                    f[i][j] = abs(j-i)
                } else {
                    f[i][j] = f[i-1][j-1]
                }
            } else {
                if i==0 && j==0 {
                    f[i][j] = 1
                } else if i==0 || j==0 {
                    f[i][j] = abs(j-i)
                } else {
                    f[i][j] = 1+min(min(f[i][j-1],f[i-1][j]),f[i-1][j-1])
                }
            }
        }
    }
    return f.last!.last!
}

editDistance("aa", "aa")
editDistance("aa", "bb")
editDistance("aa", "bbaaaa")
editDistance("bbaaaa", "aa")


/*
f[i][j] = min edit distance between start[0...i] and end[0...j]
if start[i] == end[i] {
    f[i][j] = f[i-1][j-1]
} else {
                    //insert,  //delete,  //replace
    f[i][j] = 1+min(f[i][j-1], f[i-1][j], f[i-1][j-1])
}

c
d

c
cccd

...cd
...d

...
...d

...c
...d

*/
/*
Given two words word1 and word2, find the minimum number of steps required to convert word1 to word2. (each operation is counted as 1 step.)

You have the following 3 operations permitted on a word:
- Insert a character
- Delete a character
- Replace a character
*/
