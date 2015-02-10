var should = require('should');

/*
Given an input string, write a function that returns the Run Length Encoded string for the input string.
*/

function encode(s) {
  var ret = "";
  var count = 1;
  var last = s[0];
  for (var i = 1; i<s.length+1; i++) {
    if (s[i] === last) {
      count++;
    } else {
      ret += last + count;
      last = s[i];
      count = 1;
    }
  }
  return ret;
}

filterInt = function (value) {
  if(/^(\-|\+)?([0-9]+|Infinity)$/.test(value))
    return Number(value);
  return NaN;
};

function decode(s) {
  var ret = "";
  var lastCharIndex = 0;
  for (var i = 1; i<= s.length+1; i++) {
    var string = s.substring(lastCharIndex, i);
    if (!(filterInt(string) && s[i])) {
      var num = parseInt(s.substring(lastCharIndex, i));
      for (var j = 0; j<num; j++) {
        ret += s[lastCharIndex-1];
      }
      lastCharIndex = i;
    }
  }

  return ret;
}

describe("Run Length", function() {
  it("Encoding", function() {
    encode("wwwwaaadexxxxxx").should.eql("w4a3d1e1x6");
    encode("WWWWWWWWWWWWBWWWWWWWWWWWWBBBWWWWWWWWWWWWWWWWWWWWWWWWBWWWWWWWWWWWWWW").should.eql("W12B1W12B3W24B1W14");
  });
  it("Decoding", function() {
    decode("w4a3d1e1x6").should.eql("wwwwaaadexxxxxx");
    decode("W12B1W12B3W24B1W14").should.eql("WWWWWWWWWWWWBWWWWWWWWWWWWBBBWWWWWWWWWWWWWWWWWWWWWWWWBWWWWWWWWWWWWWW");
  });
});
