class Prime

  def self.nth(number)
    primes = []
    (2..100).to_a.inject(primes) do |result, element|
      until result.index(result.last) == (number - 1)
        result << element if is_prime?(element)
        result
      end
      result
    end
    primes.last
  end

  def self.is_prime?(number)
    2.upto((number - 1)) do |i|
      return false if number % i == 0
    end
    return true
  end

end
