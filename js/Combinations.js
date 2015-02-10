var should = require('should');

/*
Given two integers n and k, return all possible combinations of k numbers out of 1...n. For example, If n = 4 and k = 2, a solution is:
[
[2,4],
[3,4],
[2,3],
[1,2],
[1,3],
[1,4],
]
*/

function combinations(n, k) {
  function helper(n, k, from, path, result) {
    if (path.length === k) {
      result.push(path.slice());
    } else {
      for (var i = from; i< n; i++) {
        path.push(i);
        helper(n, k, i+1, path, result);
        path.pop();
      }
    }
  }
  var result = [];
  helper(n+1, k, 1, [], result);
  return result;
}

describe("Combinations", function() {
  describe("I", function() {
    it("a", function() {
      var t = combinations(4,2);
      t.sort();
      var e = [ [2,4], [3,4], [2,3], [1,2], [1,3], [1,4], ];
      e.sort();
      t.should.containDeep(e);
    });
  });
});
