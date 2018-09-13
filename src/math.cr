module Math
  def isWholeNumber?(n)
    (n - n.floor).abs < 1e-10
  end

  def digitsSum(n)
    while n = digitsSumInternal(n)
      break if n < 10
    end
    n
  end

  private def digitsSumInternal(n)
    d = BigInt.new(0)
    n.to_s.each_char do |c|
      d = d + c.to_i8
    end
    d
  end
end
