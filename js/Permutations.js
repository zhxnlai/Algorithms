var should = require('should');

/*
Given a collection of numbers, return all possible permutations.
For example,
[1,2,3] have the following permutations:
[1,2,3], [1,3,2], [2,1,3], [2,3,1], [3,1,2], and [3,2,1].
*/

function permutations(a) {
  function helper(a, cur, result) {
    if (a.length === 0) {
      result.push(cur);
    } else {
      for (var i = 0; i<a.length; i++) {
        var c = cur.slice(0);
        c.push(a[i]);
        var newA = a.slice(0);
        newA.splice(i, 1);
        helper(newA, c, result);
      }
    }
  }

  result = [];
  helper(a, [], result);
  return result;
}

/*
Given a collection of numbers that might contain duplicates, return all possible unique permutations.

For example,
[1,1,2] have the following unique permutations:
[1,1,2], [1,2,1], and [2,1,1].
*/

function permutations2(a) {
  function helper(a, cur, result) {
    if (a.length === 0) {
      result.push(cur);
    } else {
      for (var i = 0; i<a.length; i++) {
        if (i && a[i] === a[i-1]) {
          continue;
        }
        var c = cur.slice(0);
        c.push(a[i]);
        var newA = a.slice(0);
        newA.splice(i, 1);
        helper(newA, c, result);
      }
    }
  }

  a.sort();
  result = [];
  helper(a, [], result);
  return result;
}

describe("Permutation", function() {
  describe("I", function() {
    it("a", function() {
      var t = permutations([1, 2, 3]);
      t.sort();
      var e = [[1,2,3], [1,3,2], [2,1,3], [2,3,1], [3,1,2], [3,2,1]];
      e.sort();
      t.should.containDeep(e);
    });
    it("b", function() {
      var t = permutations([1,1,2]);
      t.sort();
      var e = [[1,1,2], [1,2,1], [2,1,1]];
      e.sort();
      t.should.containDeep(e);
    });
  });
  describe("II", function() {
    it("a", function() {
      var t = permutations2([1,1,2]);
      t.sort();
      var e = [[1,1,2], [1,2,1], [2,1,1]];
      e.sort();
      t.should.containDeep(e);
    });
  });
});
