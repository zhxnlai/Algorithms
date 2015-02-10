var should = require('should');

function binarySearch(a, t) {
  var f = 0; var l = a.length;
  while (f !== l) {
    var mid = Math.floor(f+(l-f)/2);
    if (t === a[mid]) {
      return mid;
    } else if (t < a[mid]) {
      l = mid;
    } else {
      f = mid + 1;
    }
  }
  return -1;
}

/*
Suppose a sorted array is rotated at some pivot unknown to you beforehand.
(i.e., 0 1 2 4 5 6 7 might become 4 5 6 7 0 1 2).
You are given a target value to search. If found in the array return its index, otherwise return -1. You may assume no duplicate exists in the array.
*/

function search(a, t) {
  var f = 0;
  var l = a.length-1;

  while (f !== l) {
    var mid = Math.floor(f+(l-f)/2);
    if (t === a[mid]) {
      return mid;
    } else if (a[mid] < a[l]) {
      if (a[mid] < t && t < a[l]) {
        f = mid + 1;
      } else {
        l = mid;
      }
    } else {
      if (a[f] < t && t < a[mid]) {
        l = mid;
      } else {
        f = mid + 1;
      }
    }
  }
  return -1;
}


// [3,4,5,6,7,8,0,1,2]
// [0,1,2,3,4,5,6,7,8]

describe("Search In Rotated Sorted Array", function() {
  var sortedArrays = [[1,2,3,4], [-1,2,3,4,6,7], [-10,-2,0,40,600,7001]];
  it("Binary Search", function() {
    sortedArrays.map(function(arr) {
      for (var i = 0; i< arr.length; i++) {
        var e = arr[i];
        binarySearch(arr, e).should.eql(arr.indexOf(e));
      }
    });
  });
  it("Rotated Search", function() {
    search([0,1,2,3,4,5,6,7,8], 5).should.eql(5);
    search([0,1,2,3,4,5,6,7,8], 0).should.eql(0);
    // search([0,1,2,3,4,5,6,7,8], 8).should.eql(8);

    // search([3,4,5,6,7,8,0,1,2], 3).should.eql(0);
    // search([3,4,5,6,7,8,0,1,2], 0).should.eql(5);
    // search([3,4,5,6,7,8,0,1,2], 2).should.eql(7);
  });
});
