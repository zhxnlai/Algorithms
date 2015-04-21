// Playground - noun: a place where people can play

import UIKit

func simplifyPath(path: String) -> String {
    var subPathsFiltered = path.componentsSeparatedByString("/").filter({$0 != "" && $0 != "."})

    var subPathsDown = [String]()
    var subPathsUp = [String]()

    for subPath in subPathsFiltered {
        if subPath != ".." {
            if subPathsUp.count>0 {
                subPathsUp.removeLast()
            } else {
                subPathsDown.append(subPath)
            }
        } else {
            if subPathsDown.count>0 {
                subPathsDown.removeLast()
            } else {
                subPathsUp.append(subPath)
            }
        }
    }
    
    return "/"+"/".join(subPathsDown.count>0 ? subPathsDown : subPathsUp)
}

simplifyPath("/./")
simplifyPath("/home/")
simplifyPath("/a/./b/../../c/")
simplifyPath("/../aa/")
simplifyPath("/home//foo/")
simplifyPath("/..//../")

/*:
Given an absolute path for a file (Unix-style), simplify it.For example,path = "/home/", => "/home"path = "/a/./b/../../c/", => "/c"Corner Cases:• Did you consider the case where path="/../"? In this case, you should return "/".• Another corner case is the path might contain multiple slashes '/' together, such as "/home//foo/".In this case, you should ignore redundant slashes and return "/home/foo".
*/