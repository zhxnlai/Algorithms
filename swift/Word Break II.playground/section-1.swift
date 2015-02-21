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

func wordBreak2(s: String, dict: [String]) -> [String] {
    let strlen = countElements(s)
    
    var opt = [[Bool]](count: strlen+1, repeatedValue: [Bool](count: strlen+1, repeatedValue: false))
    for var from=0;from<=strlen;from++ {
        opt[from][from] = true
        for var to=from+1;to<=strlen;to++ {
            opt[from][to] = reduce((0..<to), false, { (acc, n) -> Bool in
                if acc {
                    return acc
                }
                return acc || (opt[from][n] && contains(dict, s[n..<to]))
            })
        }
    }

    var results = [String]()
    if !opt[0].last! {
        return results
    }
    
    var path = [String]()
    findSolutions(s, dict, opt, strlen, &path, &results)
    return results
}

func findSolutions(s :String, dict: [String], opt: [[Bool]], to: Int, inout path: [String], inout results: [String]) {
    if to == 0 {
        results.append(" ".join(path.reverse()))
    }
    for var from=0;from<to;from++ {
        if opt[from][to] && contains(dict, s[from..<to]){
            path.append(s[from..<to])
            findSolutions(s, dict, opt, from, &path, &results)
            path.removeLast()
        }
    }
}

wordBreak2("leetcode", ["leet","code"])
wordBreak2("leetcode3", ["leet", "code"])
wordBreak2("iambatman", ["i", "am", "bat", "man"])
wordBreak2("cargo", ["car", "cargo", "go", "man"])
wordBreak2("catsanddog", ["cat", "cats", "and", "sand", "dog"])


/*
Given a string s and a dictionary of words dict, add spaces in s to construct a sentence where each word is a valid dictionary word.Return all such possible sentences.For example, givens = "catsanddog",dict = ["cat", "cats", "and", "sand", "dog"].A solution is ["cats and dog", "cat sand dog"].
*/
