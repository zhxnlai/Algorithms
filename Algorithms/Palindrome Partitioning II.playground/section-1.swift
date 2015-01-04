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

func isPalindrome(s: String) -> Bool {
    return s == String(Array(s).reverse())
}

isPalindrome("aa")
isPalindrome("aab")

func palindromePartition(s: String) -> [[String]] {
    let strlen = countElements(s)
    var opt = [[Bool]](count: strlen, repeatedValue: [Bool](count: strlen, repeatedValue: false))
    for var from=0; from<strlen; from++ {
        for var to=from; to<strlen; to++ {
            if isPalindrome(s[from..<to]) {
                opt[from][to] = true
            }
            opt[from][to] = reduce(0..<to, false, { (acc, f) -> Bool in
                return acc || (opt[0][f] && isPalindrome(s[f..<to]))
            })
        }
    }
    
    var path = [String]()
    var result = [[String]]()
    findSolution(s, opt, strlen, &path, &result)

    return result
}

func findSolution(s: String, opt: [[Bool]], to: Int, inout path: [String], inout result: [[String]]) {
    if to==0 {
        result.append(Array(path))
    }
    for var from=0; from<to; from++ {
        if isPalindrome(s[from..<to]) {
            path.append(s[from..<to])
            findSolution(s, opt, from, &path, &result)
            path.removeLast()
        }
    }
}

palindromePartition("a")
palindromePartition("aa")
palindromePartition("aab")
palindromePartition("aabc")

func minCut(s: String) -> Int {
    let strlen = countElements(s)
    var opt = [Int](count: strlen+1, repeatedValue: Int.max)
    opt [0] = 0
    for var to = 1; to<=strlen; to++ {
        opt[to] = reduce(0..<to, Int.max, { (acc, from) -> Int in
            var subStr = s[from..<to]
            if isPalindrome(subStr) {
                var cut = (from == 0 ? 0: 1)
                return min(acc, opt[from]+cut)

            } else {
                return acc
            }
        })
    }
    opt
    return opt.last!
}

minCut("aab")
minCut("aabc")
minCut("aabbc")
minCut("aacbbc")

