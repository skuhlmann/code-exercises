var Hamming = {
 compute: function(strandOne, strandTwo) {
  var difference = 0;
  if (strandOne.length === strandTwo.length) {
    for (var i = 0; i < strandOne.length; i++) {
      if (strandOne[i] !== strandTwo[i]) {
      difference += 1;
      }
    }
    return difference;
  } else {
    throw new Error('DNA strands must be of equal length.');
  }
 }
};

module.exports = Hamming;

