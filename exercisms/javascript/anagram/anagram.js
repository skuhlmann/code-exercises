function anagram(word) {
  var anagrams = [];

  function alphabetize(word) {
    return word.toLowerCase().split('').sort().join();
  }

  function buildListFromArguments(words) {
    var list = [];
    for (i = 0; i < Object.keys(arguments).length; i++) {
      list.push(arguments[i]);
    };
    return list;
  }

  this.matches = function(wordList) {
    if (typeof(wordList) === 'string') {
      var list = [];
      for (i = 0; i < Object.keys(arguments).length; i++) {
        list.push(arguments[i]);
      };
      wordList = list
    }
    wordList.forEach( function(element) {
      if ( word.toLowerCase() === element.toLowerCase()) {
        return anagrams;
      } else if ( alphabetize(word) === alphabetize(element)) {
        anagrams.push(element);
      }
    });
    return anagrams;
  };
  return this;
};


module.exports = anagram;
