// Playground - noun: a place where people can play

import UIKit

extension String {
    subscript (i: Int) -> String {
        return String(Array(self)[i])
    }
}

func isMatch(s: String, p: String) -> Bool {
    var startS = 0
    var startP = 0
    
    while startS<countElements(s) && startP<countElements(p) {
        var curS = s[startS]
        var curP = p[startP]
        if let nextP = (startP+1)<countElements(p) ? p[startP+1] : nil {
            if nextP == "*" {
                while startS<countElements(s) && (curP == s[startS] || curP == ".")  {
                    startS++
                }
                startP+=2
                continue
            }
        }
    
        if curP == "." || curP == curS {
            startS++
            startP++
            continue
        }
    
        return false
    }
    
    if startS < countElements(s) || startP < countElements(p) {
        return false
    }
    return true
}



isMatch("aa","a")
isMatch("aa","aa")

isMatch("aaa","aa")
isMatch("aa", "a*")
isMatch("aa", ".*")
isMatch("ab", ".*")
isMatch("aab", "c*a*b")





/*Implement regular expression matching with support for '.' and '*'.'.' Matches any single character. '*' Matches zero or more of the preceding element. The matching should cover the entire input string (not partial).The function prototype should be:bool isMatch(const char *s, const char *p)Some examples:isMatch("aa","a") → falseisMatch("aa","aa") → trueisMatch("aaa","aa") → falseisMatch("aa", "a*") → trueisMatch("aa", ".*") → trueisMatch("ab", ".*") → trueisMatch("aab", "c*a*b") → true
*/
