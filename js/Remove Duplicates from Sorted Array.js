var should = require('should');

function removeDuplicateN(n,a) {
  return function(a) {
    var r = n;
    for (var i = n; i< a.length; i++) {
      if (a[i] !== a[r-n]) {
        a[r] = a[i];
        r++;
      }
    }
    return a.slice(0, r);
  };
}

/*
Given a sorted array, remove the duplicates in place such that each element appear only once and return the new length.Do not allocate extra space for another array, you must do this in place with constant memory.For example, Given input array A = [1,1,2],Your function should return length = 2, and A is now [1,2].
*/

var removeDuplicate = removeDuplicateN(1);

/*
Follow up for ”Remove Duplicates”: What if duplicates are allowed at most twice? For example, Given sorted array A = [1,1,1,2,2,3],
Your function should return length = 5, and A is now [1,1,2,2,3]
*/

var removeDuplicate2 = removeDuplicateN(2);

/*
Follow up for ”Remove Duplicates”: What if duplicates are allowed at most three times?
*/

var removeDuplicate3 = removeDuplicateN(3);

describe("Remove Duplicates", function() {
  it("I", function() {
    JSON.stringify(removeDuplicate([1,1,2])).should.equal(JSON.stringify([1,2]));
    JSON.stringify(removeDuplicate([1,1,2,2,3,4,5,6])).should.equal(JSON.stringify([1,2,3,4,5,6]));
    JSON.stringify(removeDuplicate([1,1,2,6,6,6,55])).should.equal(JSON.stringify([1,2,6,55]));
  });
  it("II", function() {
    JSON.stringify(removeDuplicate2([1,1,2])).should.equal(JSON.stringify([1,1,2]));
    JSON.stringify(removeDuplicate2([1,1,2,2,3,4,5,6])).should.equal(JSON.stringify([1,1,2,2,3,4,5,6]));
    JSON.stringify(removeDuplicate2([1,1,2,6,6,6,55])).should.equal(JSON.stringify([1,1,2,6,6,55]));
  });
  it("III", function() {
    JSON.stringify(removeDuplicate3([1,1,2])).should.equal(JSON.stringify([1,1,2]));
    JSON.stringify(removeDuplicate3([1,1,2,2,3,4,5,6])).should.equal(JSON.stringify([1,1,2,2,3,4,5,6]));
    JSON.stringify(removeDuplicate3([1,1,2,6,6,6,55])).should.equal(JSON.stringify([1,1,2,6,6,6,55]));
    JSON.stringify(removeDuplicate3([1,1,1,2,3,6,6,6,55])).should.equal(JSON.stringify([1,1,1,2,3,6,6,6,55]));
  });

});
