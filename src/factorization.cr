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
      if (n % i == 0)
        factors << i
      end
    end
    return factors
  end
end
