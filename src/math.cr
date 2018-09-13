module Math
  def isWholeNumber?(n)
    # puts n
    # puts n.floor
    (n - n.floor).abs < 1e-10
  end

  def sumDigits(n)
    while n = sumDigitsInt(n)
      break if n < 10
    end
    n
  end

  private def sumDigitsInt(n)
    d = BigInt.new(0)
    n.to_s.each_char do |c|
      d = d + c.to_i8
    end
    d
  end
end
