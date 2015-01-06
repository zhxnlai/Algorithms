// Playground - noun: a place where people can play

import UIKit

/*
Given a string, determine if it is a palindrome, considering only alphanumeric characters and ignoring cases.For example,”A man, a plan, a canal: Panama” is a palindrome. ”race a car” is not a palindrome.Note: Have you consider that the string might be empty? This is a good question to ask during an interview.For the purpose of this problem, we define empty string as valid palindrome.
*/


func validPalindrome(s: String) -> Bool {
    var s = s.lowercaseString
    
    var start=0, end=Int(countElements(s))-1
    while !s[start].isAlpha() {
        start++
    }
    while !s[end].isAlpha() {
        end--
    }

    while (start<end) {
        if s[start] != s[end] {
            return false
        } else {
            start++
            end--

            while !s[start].isAlpha() && start<end {
                start++
            }
            while !s[end].isAlpha() && start<end  {
                end--
            }
        }
    }
    
    return true
}

extension String {
    subscript (i: Int) -> String {
        return String(Array(self)[i])
    }
            
    func isAlpha() -> Bool {
    return ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"].reduce(false, combine: { (acc, s1) -> Bool in
    acc || self==s1
    })
    }

}

validPalindrome("aba")
validPalindrome("acbca")
validPalindrome("acbcaa")
validPalindrome("A man, a plan, a canal: Panama")
