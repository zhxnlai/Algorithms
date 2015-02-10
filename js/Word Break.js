var should = require('should');
var format = require('util').format;

/*
Given a string s and a dictionary of words dict, determine if s can be segmented into a space-separated sequence of one or more dictionary words.For example, given s = "leetcode",dict = ["leet", "code"].Return true because "leetcode" can be segmented as "leet code".
*/

function wordBreak(s, dict) {
  function helper(s, dict, to, r) {
    if (r.r === true || to === s.length) {
      r.r = true;
      return;
    } else {
      for (var from = to; from <= s.length; from++) {
        var substring = s.substring(to, from);
        if (dict.indexOf(substring) >= 0) {
          helper(s, dict, from, r);
        }
      }
    }
  }

  var r = {
    r: false
  };
  helper(s, dict, 0, r);
  return r.r;
}

function wordBreakDP(s, dict) {
  var opt = [];
  for (var i = 0; i < s.length; i++) {
    opt[i] = false;
  }
  opt[0] = true;
  for (var i = 1; i <= s.length; i++) {
    for (var j = 0; j <= i; j++) {
      opt[i] = opt[i] || opt[j] && dict.indexOf(s.substring(i, j)) >= 0;
    }
  }
  return opt[opt.length - 1];
}

/*
Given a string s and a dictionary of words dict, add spaces in s to construct a sentence where each word is a valid dictionary word.
Return all such possible sentences.
For example, given
s = "catsanddog",
dict = ["cat", "cats", "and", "sand", "dog"].
A solution is ["cats and dog", "cat sand dog"].
*/

function wordBreak2(s, dict) {
  function helper(s, dict, to, path, r) {
    if (to === s.length) {
      r.push(path.join(" "));
    } else {
      for (var from = to; from <= s.length; from++) {
        var substring = s.substring(to, from);
        if (dict.indexOf(substring) >= 0) {
          path.push(substring);
          helper(s, dict, from, path, r);
          path.pop();
        }
      }
    }
  }

  var r = [];
  helper(s, dict, 0, [], r);
  return r;
}

function wordBreak2DP(s, dict) {
  var opt = Array.apply(null, new Array(s.length+1)).map(function() {
    return Array.apply(null, new Array(s.length+1)).map(function() {
      return false;
    });
  });

  for (var from = 0; from<=s.length; from++) {
    opt[from][from] = true;
    for (var to = from+1; to<=s.length; to++) {
      for (var m = 0; m<=to; m++) {
        opt[from][to] = opt[from][to] || opt[from][m] && dict.indexOf(s.substring(m, to))>=0;
      }
    }
  }

  function helper(s, dict, opt, from, path, result) {
    if (from === s.length) {
      result.push(path.join(" "));
    } else {
      for (var to = from+1; to<=s.length; to++) {
        if (opt[from][to]) {
          path.push(s.substring(from, to));
          helper(s, dict, opt, to, path, result);
          path.pop();
        }
      }
    }
  }

  var lastRow = opt[opt.length - 1];
  var isTrue = lastRow[lastRow.length - 1];
  if (isTrue) {
    var result = [];
    helper(s, dict, opt, 0, [], result);
    return result;
  } else {
    return [];
  }
}

function test1(f) {
  it("a", function() {
    f("leetcode", ["leet", "code"]).should.eql(true);
  });
  it("b", function() {
    f("leetcode3", ["leet", "code"]).should.eql(false);
  });
  it("c", function() {
    f("iambatman", ["i", "am", "bat", "man"]).should.eql(true);
  });
  it("d", function() {
    f("cargo", ["i", "am", "go", "car"]).should.eql(true);
  });
  it("e", function() {
    f("cargo", ["i", "am", "car"]).should.eql(false);
  });
}

function test2(f) {
  function helper(input, expect) {
    var t = f.apply(null, input);
    t.sort();
    var e = expect;
    e.sort();
    t.should.containDeep(e);
  }
  it("a", function() {
    helper(["leetcode", ["leet", "code"]], ["leet code"]);
  });
  it("b", function() {
    helper(["catsanddog", ["cat", "cats", "and", "sand", "dog"]], ["cats and dog", "cat sand dog"]);
  });
  it("c", function() {
    helper(["iambatman", ["i", "am", "bat", "man"]], ["i am bat man"]);
  });
}


describe("Word Break", function() {
  describe("I DFS", function() {
    test1(wordBreak);
  });
  describe("I DP", function() {
    test1(wordBreakDP);
  });

  describe("II DFS", function() {
    test2(wordBreak2);
  });

  describe("II DP", function() {
    test2(wordBreak2DP);
  });

});
