// Playground - noun: a place where people can play

import UIKit


func lengthOfLastWord(s: String) -> Int {
    let words = s.componentsSeparatedByString(" ")
    if let lastWord = words.last {
        return count(lastWord)
    } else {
        return 0
    }
}

lengthOfLastWord("hello world")

/*Given a string s consists of upper/lower-case alphabets and empty space characters ' ', return the length of last word in the string.If the last word does not exist, return 0.Note: A word is defined as a character sequence consists of non-space characters only. For example, Given s = "Hello World", return 5.
*/
