var should = require('should');

/*
Given two words (start and end), and a dictionary, find the length of shortest transformation sequence from start to end, such that:
• Only one letter can be changed at a time
• Each intermediate word must exist in the dictionary
For example, Given:
start = "hit"
end = "cog"
dict = ["hot","dot","dog","lot","log"]
As one shortest transformation is "hit" -> "hot" -> "dot" -> "dog" -> "cog", return its length 5.
Note:
• Return 0 if there is no such transformation sequence.
• All words have the same length.
• All words contain only lowercase alphabetic characters..
*/

function wordLadder(start, end, dict) {

  function diffByOneChar(s1, s2) {
    if (s1.length != s2.length) {
      return false;
    }
    var nDiff = 0;
    for (var i = 0; i< s1.length; i++) {
      if (s1[i] != s2[i]) {
        nDiff ++;
      }
    }
    return nDiff === 1;
  }

  var queue = [];
  var visited = [];
  queue.push([start, 1]);
  while (queue.length > 0) {
    var first = queue.shift();
    var curWord = first[0];
    var depth = first[1];
    if (diffByOneChar(curWord, end)) {
      return depth + 1;
    } else {
      for (var i = 0; i<dict.length; i++) {
        var word = dict[i];
        if (visited.indexOf(word) < 0 && diffByOneChar(curWord, word)) {
          visited.push(word);
          queue.push([word, depth+1]);
        }
      }
    }
  }

  return 0;
}

describe("Word Ladder", function() {
  it("Test", function() {
    wordLadder("hit", "cog", ["hot","dot","dog","lot","log"]).should.equal(5);
  });
});
