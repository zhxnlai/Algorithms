var should = require('should');
var assert = require('assert');

/*
Given a set of distinct integers, S, return all possible subsets.
Note:
• Elements in a subset must be in non-descending order.
• The solution set must not contain duplicate subsets.
For example, If S = [1,2,3], a solution is:

[
[3],
[1],
[2],
[1,2,3],
[1,3],
[2,3],
[1,2],
[]
]
*/

function subset(a) {
  function helper(a, i, path, acc) {
    if (i === a.length) {
      acc.push(path.slice());
    } else {
      path.push(a[i]);
      helper(a, i+1, path, acc);
      path.pop();

      helper(a, i+1, path, acc);
    }
  }
  var acc = [];
  var path = [];
  helper(a, 0, path, acc);
  return acc;
}


/*
Given a collection of integers that might contain duplicates, S, return all possible subsets.
Note:
Elements in a subset must be in non-descending order. The solution set must not contain duplicate
subsets. For example, If S = [1,2,2], a solution is:

[
[2],
[1],
[1,2,2],
[2,2],
[1,2],
[]
]
*/

// function subset2(a) {
//   function helper(a, cur, result) {
//     if (a.length === 0) {
//       result.push(cur.slice());
//     } else {
//       for (var i = 0; i<a.length; i++) {
//         if (i && a[i] === a[i-1]) {
//           continue;
//         }
//         var c = cur.slice(0);
//         c.push(a[i]);
//         var newA = a.slice(0);
//         newA.splice(i, 1);
//         helper(newA, c, result);
//
//         var c2 = cur.slice(0);
//         helper(newA, c2, result);
//
//       }
//     }
//   }
//
//   a.sort();
//   result = [];
//   helper(a, [], result);
//   console.log(result);
//   return result;
// }


function subset2(a) {
  function helper(a, i, path, acc) {
    if (i >= a.length) {
      acc.push(path.slice());
    } else {
      // for (var j = i; i< a.length; i++) {
      //   if (j !== 0 && a[j] === a[j-1]) {
      //     continue;
      //   }
      // }

      // if (i>0 && a[i] === a[i-1]) {
      //   helper(a, i+1, path, acc);
      //   return;
      // }

      path.push(a[i]);
      helper(a, i+1, path, acc);
      path.pop();

      helper(a, i+1, path, acc);

    }
  }
  a.sort(function(a, b) {
    return a - b;
  });
  var acc = [];
  var path = [];
  helper(a, 0, path, acc);
  return acc;
}

describe("Subset", function() {
  it("I", function() {
    var t = subset([1, 2, 3]);
    t.sort();
    var e = [ [3], [1], [2], [1, 2, 3], [1, 3], [2, 3], [1, 2], [] ];
    e.sort();
    t.should.containDeep(e);
  });

  it("II", function() {
    var t = subset2([1, 2, 2]);
    t.sort();
    var e = [ [2], [1], [1,2,2], [2,2], [1,2], [] ];
    e.sort();
    t.should.containDeep(e);
  });
});
