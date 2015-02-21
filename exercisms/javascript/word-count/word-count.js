var words = function(phrase) {
    var wordCount = {};
    phrase.split(/\s/).forEach(function(word) {
        if (!wordCount[word]) {
            wordCount[word] = 1;
        } else {
            wordCount[word]++;
        }
    });
    return wordCount;
};

module.exports = words;
