var should = require('should');

/*Given an array of integers, find two numbers such that they add up to a specific target number.The function twoSum should return indices of the two numbers such that they add up to the target, where index1 must be less than index2. Please note that your returned answers (both index1 and index2) are not zero-based.You may assume that each input would have exactly one solution. Input: numbers={2, 7, 11, 15}, target=9Output: index1=1, index2=2
*/

function twoSum(a, n) {
  a.sort(function(a, b) {
    return a - b;
  });
  var dict = a.reduce(function(acc, e, i) {
    acc[e] = i;
    return acc;
  }, {});
  var ret = [];
  a.forEach(function(e, i) {
    var other = n-e;
    if (dict[other]) {
      ret = [i, dict[other]];
    }
  });
  return ret;
}


describe("Two Sum", function() {
  it("O(n)", function() {
    JSON.stringify(twoSum([2,7,11,15], 9)).should.equal(JSON.stringify([0,1]));
    JSON.stringify(twoSum([-3,1,3,15], 0)).should.equal(JSON.stringify([0,2]));
    // JSON.stringify(twoSum([1,1,2,6,6,6,55])).should.equal(JSON.stringify([1,2,6,55]));
  });
  it("O(logn)", function() {
    // JSON.stringify(removeDuplicate2([1,1,2])).should.equal(JSON.stringify([1,1,2]));
    // JSON.stringify(removeDuplicate2([1,1,2,2,3,4,5,6])).should.equal(JSON.stringify([1,1,2,2,3,4,5,6]));
    // JSON.stringify(removeDuplicate2([1,1,2,6,6,6,55])).should.equal(JSON.stringify([1,1,2,6,6,55]));
  });

});
