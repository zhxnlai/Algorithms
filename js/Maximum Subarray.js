var should = require('should');

/*
Find the contiguous subarray within an array (containing at least one number) which has the largest sum.
For example, given the array [-2,1,-3,4,-1,2,1,-5,4], the contiguous subarray [4,-1,2,1] has the largest sum = 6.
*/

function maxSubarray(a) {
  var opt = [];
  for (var from = 0; from < a.length; from++) {
    opt[from] = new Array(a.length);
    opt[from] = opt[from].map(function() {return 0;});
    opt[from][from] = a[from];
    for (var to = from+1; to < a.length; to++) {
        opt[from][to] = opt[from][to-1] + a[to];
    }
  }

  var max = Number.MIN_VALUE;
  var maxRange = [];
  for (var from = 0; from < a.length; from++) {
    for (var to = from; to < a.length; to++) {
        if (opt[from][to]>max) {
          max = opt[from][to];
          maxRange = [from, to+1];
        }
    }
  }

  return Array.prototype.slice.apply(a, maxRange);
}


function maxSubarraySum(a) {
  var maxSum = a[0];
  var f = a[0];
  for (var i = 0; i<a.length; i++) {
    f = Math.max(f+a[i], a[i]);
    maxSum = Math.max(maxSum, f);
  }
  return maxSum;
}

describe("Maximum Subarray", function() {
  it("Array", function() {
    JSON.stringify(maxSubarray([-2,1,-3,4,-1,2,1,-5,4])).should.equal(JSON.stringify([4,-1,2,1]));
    JSON.stringify(maxSubarray([-3,1,3,15])).should.equal(JSON.stringify([1,3,15]));
    // JSON.stringify(twoSum([1,1,2,6,6,6,55])).should.equal(JSON.stringify([1,2,6,55]));
  });

  it("Sum", function() {
    JSON.stringify(maxSubarraySum([-2,1,-3,4,-1,2,1,-5,4])).should.equal(JSON.stringify(6));
    JSON.stringify(maxSubarraySum([-3,1,3,15])).should.equal(JSON.stringify(19));
    // JSON.stringify(twoSum([1,1,2,6,6,6,55])).should.equal(JSON.stringify([1,2,6,55]));
  });
});
