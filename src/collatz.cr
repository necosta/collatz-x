require "./math"

module Collatz
  extend self

  def runOnce(n)
    out = BigInt.new(n)
    if (out % 2 == 0)
      out / 2
    else
      out * 3 + 1
    end
  end

  def runFast(n)
    while n = Collatz.runOnce(n)
      break if n == 1
    end
  end

  def runWithPrint(n)
    out = Array({BigInt, String}).new
    flowSeq = ""
    prev = n
    while n = Collatz.runOnce(n)
      digitsSum = Math.digitsSum(n)
      flowSeq = getFlowSeq(digitsSum, n, prev, flowSeq)
      if (n % 2 == 0 && digitsSum == 4)
        out << {n, flowSeq}
        flowSeq = ""
      end
      prev = n
      break if n == 1
    end
    out
  end

  private def getFlowSeq(digitsSum, n, tmp, str)
    digitsSumPrev = Math.digitsSum(tmp)
    case
    when n % 2 == 0 && digitsSum == 2 && digitsSumPrev == 4
      str += "A"
    when n % 2 == 1 && digitsSum == 2 && digitsSumPrev == 4
      str += "G"
    when n % 2 == 0 && digitsSum == 1 && digitsSumPrev == 2
      str += "B"
    when n % 2 == 1 && digitsSum == 1 && digitsSumPrev == 2
      str += "H"
    when n % 2 == 0 && digitsSum == 5 && digitsSumPrev == 1
      str += "C"
    when n % 2 == 1 && digitsSum == 5 && digitsSumPrev == 1
      str += "I"
    when n % 2 == 0 && digitsSum == 7 && digitsSumPrev == 5
      str += "D"
    when n % 2 == 1 && digitsSum == 7 && digitsSumPrev == 5
      str += "J"
    when n % 2 == 0 && digitsSum == 8 && digitsSumPrev == 7
      str += "E"
    when n % 2 == 1 && digitsSum == 8 && digitsSumPrev == 7
      str += "K"
    when n % 2 == 0 && digitsSum == 4 && digitsSumPrev == 8
      str += "F"
    when n % 2 == 1 && digitsSum == 4 && digitsSumPrev == 8
      str += "L"
    end
    str
  end
end
