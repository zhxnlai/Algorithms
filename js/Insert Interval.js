var should = require('should');

/*
Given a set of non-overlapping intervals, insert a new interval into the intervals (merge if necessary). You may assume that the intervals were initially sorted according to their start times.
Example 1: Given intervals [1,3],[6,9], insert and merge [2,5] in as [1,5],[6,9].
Example 2: Given [1,2],[3,5],[6,7],[8,10],[12,16], insert and merge [4,9] in as
[1,2],[3,10],[12,16].
This is because the new interval [4,9] overlaps with [3,5],[6,7],[8,10].
*/

function inserAndMerge(a, insert) {
  function isOverlapping(a, b) {
    return a[1] >= b[0] && a[0] <= b[1];
  }

  function merge(a, b) {
    return [Math.min(a[0], b[0]), Math.max(a[1], b[1])];
  }

  var ret = [];
  var merged = insert;
  for (var i = 0; i< a.length; i++) {
    var interval = a[i];
    if (isOverlapping(a[i], merged)) {
      merged = merge(merged, a[i]);
    } else {
      ret.push(interval);
    }
  }

  ret.push(merged);
  return ret;
}


describe("Insert intervals", function() {
  it("a", function() {
    var t = inserAndMerge([[1,3],[6,9]], [2,5]);
    t.sort();
    var e = [[6,9], [1,5]];
    e.sort();
    t.should.containDeep(e);
  });
  it("b", function() {
    var t = inserAndMerge([[6,9], [1,3]], [2,5]);
    t.sort();
    var e = [[6,9], [1,5]];
    e.sort();
    t.should.containDeep(e);
  });
  it("c", function() {
    var t = inserAndMerge([[6,9],[4,5], [1,3]], [2,5]);
    t.sort();
    var e = [[6,9], [1,5]];
    e.sort();
    t.should.containDeep(e);
    e.should.containDeep(t);
  });
  it("d", function() {
    var t = inserAndMerge([[6,9],[4,5], [2,3]], [3,4]);
    t.sort();
    var e = [[6,9], [2,5]];
    e.sort();
    t.should.containDeep(e);
    e.should.containDeep(t);
  });

});
