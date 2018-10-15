module Math
  def isNaturalNumber?(n)
    check_positive_number n
    (n - n.floor).abs < 1e-10
  end

  def digitsSum(n)
    check_positive_number n
    while n = digitsSumInternal(n)
      break if n < 10
    end
    n
  end

  private def digitsSumInternal(n)
    d = BigInt.new(0)
    n.to_s.each_char do |c|
      d = d + c.to_u8
    end
    d
  end

  private def check_positive_number(value)
    if value <= 0
      raise NumberMustBePositiveError.new
    end
  end
end

class NumberMustBePositiveError < Exception
  def initialize(message = "Number must be greater than 0")
    super(message)
  end
end
