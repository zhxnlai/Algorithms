// Playground - noun: a place where people can play

import UIKit

func isPalindromeNumber(n: Int) -> Bool {
    var n = n
    if n < 0 {
        return false
    }
    var d = 1
    while n/d >= 10 {
        d *= 10
    }
    d
    while n>0 {
        var q = n/d
        var r = n%10
        if q != r {
            return false
        }
        n = n%d / 10 //remove first and last digit
        d/=100
    }
    return true
}

isPalindromeNumber(1223221)

/*:
Determine whether an integer is a palindrome. Do this without extra space.Some hints:Could negative integers be palindromes? (ie, -1)If you are thinking of converting the integer to string, note the restriction of using extra space.You could also try reversing an integer. However, if you have solved the problem ”Reverse Integer”,you know that the reversed integer might overflow. How would you handle such case? There is a more generic way of solving this problem.
*/