require 'pry'

class Prime

  def self.nth(number)
    fail ArgumentError if number <= 0
    primes = []
    (2..105_743).to_a.inject(primes) do |result, element|
      break if result.index(result.last) == (number - 1)
      result << element if is_prime?(element)
      result
    end
    primes[number - 1]
  end

  def self.is_prime?(number)
    2.upto((number - 1)) do |i|
      return false if number % i == 0
    end
    return true
  end

end
