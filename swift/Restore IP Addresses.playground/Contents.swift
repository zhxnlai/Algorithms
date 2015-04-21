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

func restoreIpAddresses(s: String) -> [String] {
    var result = [String]()
    var path = [String]()
    helper(s, 0, &path, &result)
    return result
}

func helper(s: String, from: Int, inout path: [String], inout result: [String]) {
    let strlen = count(s)
    if from==strlen {
        result.append(".".join(path))
    }
    for var to=from+1; to<=strlen; to++ {
        let subStr = s[from..<to]
        if subStr.toInt()<=255 && path.count<4 {
            path.append(subStr)
            helper(s, to, &path, &result)
            path.removeLast()
        }
    }
}

restoreIpAddresses("25525511135")

"254".toInt()<255

/*
Given a string containing only digits, restore it by returning all possible valid IP address combinations. For example: Given ”25525511135”,return [”255.255.11.135”, ”255.255.111.35”]. (Order does not matter)
*/
