var should = require('should');

function reverse(n) {
  var r = 0;
  for (; n !== 0; n = Math.floor(n/10)) {
    r = Math.floor(r*10 + n % 10);
  }
  return r;
}

describe("Reverse Integer", function() {
  it("Test", function() {
    reverse(123).should.eql(321);
    // reverse(-123).should.eql(-321);

    reverse(12321).should.eql(12321);

  });
});
