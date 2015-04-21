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

func minimumWindow(s: String, t: String) -> [String] {
    let slen = count(s), tlen = count(t)

    
    var minLen = Int.max, minString = ""
    var lower = 0, upper = 0
    
    var windows = [String]()
    
    for upper in 0..<slen {
        if containsAll(s[lower...upper], t) {
            while lower<upper && containsAll(s[lower...upper], t) {
                lower++
            }
            lower--
            windows.append(s[lower...upper])
        }
    }
    return windows
}

func containsAll(s: String, t: String) -> Bool {
    var dict = [Character: Int]()
    for c in s {
        if let n = dict[c] {
            dict[c] = n+1
        } else {
            dict[c] = 1
        }
    }
    
    for c in t {
        if let n = dict[c] {
        } else {
            return false
        }
    }
    
    return true
}

minimumWindow("ADOBECODEBANC", "ABC")

func minimumWindow2(s: String, t: String) -> String {
    let slen = count(s), tlen = count(t)

    var dictS = [Character: Int]()
    for c in s {
        if let n = dictS[c] {
            dictS[c] = n+1
        } else {
            dictS[c] = 1
        }
    }
    
    var dictT = [Character: Int]()
    for c in t {
        dictT[c] = 1
        if let n = dictS[c] {
        } else {
            return ""
        }
    }
    
    var lower = 0, upper = 0
    for lower = 0; lower<slen; lower++ {
        var c = Array(s)[lower]
        if let isInT = dictT[c] {
            if let countInS = dictS[c] {
                dictS[c] = countInS-1
                if countInS-1 == 0 {
                    break
                }
            }
        }
    }

    for upper = slen-1; upper>=0; upper-- {
        var c = Array(s)[upper]
        if let isInT = dictT[c] {
            if let countInS = dictS[c] {
                dictS[c] = countInS-1
                if countInS-1 == 0 {
                    break
                }
            }
        }
    }
    
    lower
    upper
    return s[lower...upper]
}

minimumWindow2("ADOBECODEBANC", "ABC")
minimumWindow2("ADOBECODEBANCCCCC", "ABC")


/*
Given a string S and a string T , find the minimum window in S which will contain all the characters in T in complexity O(n).For example, S = ”ADOBECODEBANC”, T = ”ABC” Minimum window is ”BANC”.Note:• If there is no such window in S that covers all characters in T, return the emtpy string ””.• If there are multiple such windows, you are guaranteed that there will always be only one uniqueminimum window in S.
*/
