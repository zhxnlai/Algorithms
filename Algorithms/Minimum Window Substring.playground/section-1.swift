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
    let slen = countElements(s), tlen = countElements(t)

    
    var minLen = Int.max, minString = ""
    var lower = 0, higher = 0
    
    var windows = [String]()
    
    for higher in 0..<slen {
        if containsAll(s[lower...higher], t) {
            while lower<higher && containsAll(s[lower...higher], t) {
                lower++
            }
            lower--
            windows.append(s[lower...higher])
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
    let slen = countElements(s), tlen = countElements(t)

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
    
    var lower = 0, higher = 0
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

    for higher = slen-1; higher>=0; higher-- {
        var c = Array(s)[higher]
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
    higher
    return s[lower...higher]
}

minimumWindow2("ADOBECODEBANC", "ABC")
minimumWindow2("ADOBECODEBANCCCCC", "ABC")


/*
Given a string S and a string T , find the minimum window in S which will contain all the characters in T in complexity O(n).For example, S = ”ADOBECODEBANC”, T = ”ABC” Minimum window is ”BANC”.Note:• If there is no such window in S that covers all characters in T, return the emtpy string ””.• If there are multiple such windows, you are guaranteed that there will always be only one uniqueminimum window in S.
*/
