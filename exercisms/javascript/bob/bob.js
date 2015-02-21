var Bob = function() {};

Bob.prototype.hey = function(input) {
  if(input.toUpperCase() == input && input.match(/[A-Z]/)){
    return 'Woah, chill out!'; 
  } 
  else if(input.charAt(input.length - 1) == "?"){
    return 'Sure.';
  }
  else if(!input.match(/[^\s]/)){
    return 'Fine. Be that way!';
  }
  return 'Whatever.';
};

module.exports = Bob;
