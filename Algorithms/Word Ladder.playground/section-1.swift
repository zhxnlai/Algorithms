// Playground - noun: a place where people can play

import UIKit

func wordLadder(start: String, end: String, dict: [String]) -> Int {
    
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
    
    // keep track of visited nodes
    var queue = [(String, Int)]()
    var visited = [String]()
    queue.append((start, 1))
    while queue.count>0 {
        var (curWord, depth) = queue.removeAtIndex(0)
        if differByOneChar(curWord, end) {
            return depth+1
        }
        for word in dict {
            if !contains(visited, word) && differByOneChar(curWord, word) {
                visited.append(word)
                queue.append((word, depth+1))
            }
        }
    }
    
    return 0
}

wordLadder("hit", "cog", ["hot","dot","dog","lot","log"])

/*
Given two words (start and end), and a dictionary, find the length of shortest transformation sequence from start to end, such that:
• Only one letter can be changed at a time
• Each intermediate word must exist in the dictionary
For example, Given:
start = "hit"
end = "cog"
dict = ["hot","dot","dog","lot","log"]
As one shortest transformation is "hit" -> "hot" -> "dot" -> "dog" -> "cog", return its length 5.
Note:• Return 0 if there is no such transformation sequence.• All words have the same length.• All words contain only lowercase alphabetic characters..
*/