module Math
  def isWholeNumber?(n)
    n.to_i === n
  end

  def sumDigits(n)
    while n = sumDigitsInt(n)
      break if n < 10
    end
    n
  end

  private def sumDigitsInt(n)
    d = 0
    n.to_s.each_char do |c|
      d = d + c.to_i
    end
    d
  end
end
