// Playground - noun: a place where people can play

import UIKit

func wordLadder(start: String, end: String, dict: [String]) -> [[String]] {
    
    func differByOneChar(s1: String, s2: String) -> Bool {
        if countElements(s1) != countElements(s2) {
            return false
        }
        var nDiff = 0
        for i in 0..<countElements(s1) {
            if Array(s1)[i] != Array(s2)[i] {
                nDiff++
            }
        }
        return nDiff == 1
    }
    
    var paths = [[String]]() //how do you keep track of level?
    // keep track of visited nodes
    var queue = [(String, Int, [String])]()
    var visited = [String]()
    queue.append((start, 1, []))
    while queue.count>0 {
        var (curWord, depth, path) = queue.removeAtIndex(0)
        if differByOneChar(curWord, end) {
            paths.append([start]+path+[end])
        }
        for word in dict {
            if !contains(visited, word) && differByOneChar(curWord, word) {
                visited.append(word)
                queue.append((word, depth+1, path+[word]))
            }
        }
    }
    
    return paths
}

wordLadder("hit", "cog", ["hot","dot","dog","lot","log"])
/*
Given two words (start and end), and a dictionary, find all shortest transformation sequence(s) from start to end, such that:
- Only one letter can be changed at a time
- Each intermediate word must exist in the dictionary

For example, Given:
start = "hit"
end = "cog"
dict = ["hot","dot","dog","lot","log"]
Return
[
["hit","hot","dot","dog","cog"],
["hit","hot","lot","log","cog"]
]

Note:
- All words have the same length.
- All words contain only lowercase alphabetic characters.
*/