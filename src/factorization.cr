module Math
  def isPrime(n)
    return false if n < 2
    return true if n == 2
    (2..Math.sqrt(n) + 1).each { |i| return false if n % i == 0 }
    return true
  end
end
