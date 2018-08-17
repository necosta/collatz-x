module Math
  def prime?(n)
    return false if n < 2
    return true if n == 2
    (2..Math.sqrt(n) + 1).each { |i| return false if n % i == 0 }
    return true
  end

  def computePrimes(max)
    (2..max).select { |n| prime?(n) }
  end

  def factorize(n)
    factors = Array(Int32).new
    computePrimes(n).each do |i|
      n1 = n
      while (n1 % i == 0)
        factors << i
        n1 = n1 / i
      end
    end
    return factors
  end
end
