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
    sysout = Array({BigInt, String}).new
    str = ""
    tmp = n
    while n = Collatz.runOnce(n)
      digitsSum = Math.digitsSum(n)
      str = getFlowId(digitsSum, n, tmp, str)
      # Only display on 4sum even number
      if (n % 2 == 0 && digitsSum == 4)
        sysout << {n, str}
        str = ""
      end
      tmp = n
      break if n == 1
    end
    sysout
  end

  def runWithSpecialIterationsCount(n)
    counter = 0
    while n = Collatz.runOnce(n)
      if (n % 2 == 1 && Math.digitsSum(n) == 8)
        counter = counter + 1
      end
      break if n == 1
    end
    counter
  end

  private def getFlowId(digitsSum, n, tmp, str)
    digitsSumPrev = Math.digitsSum(tmp)
    case
    when n % 2 == 0 && digitsSum == 2 && digitsSumPrev == 4
      str = str + "A"
    when n % 2 == 1 && digitsSum == 2 && digitsSumPrev == 4
      str = str + "G"
    when n % 2 == 0 && digitsSum == 1 && digitsSumPrev == 2
      str = str + "B"
    when n % 2 == 1 && digitsSum == 1 && digitsSumPrev == 2
      str = str + "H"
    when n % 2 == 0 && digitsSum == 5 && digitsSumPrev == 1
      str = str + "C"
    when n % 2 == 1 && digitsSum == 5 && digitsSumPrev == 1
      str = str + "I"
    when n % 2 == 0 && digitsSum == 7 && digitsSumPrev == 5
      str = str + "D"
    when n % 2 == 1 && digitsSum == 7 && digitsSumPrev == 5
      str = str + "J"
    when n % 2 == 0 && digitsSum == 8 && digitsSumPrev == 7
      str = str + "E"
    when n % 2 == 1 && digitsSum == 8 && digitsSumPrev == 7
      str = str + "K"
    when n % 2 == 0 && digitsSum == 4 && digitsSumPrev == 8
      str = str + "F"
    when n % 2 == 1 && digitsSum == 4 && digitsSumPrev == 8
      str = str + "L"
    end
    str
  end
end
