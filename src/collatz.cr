require "./math"

module Collatz
  extend self

  def runOnce(n)
    if (n % 2 == 0)
      n / 2
    else
      n * 3 + 1
    end
  end

  def runFast(n)
    while n = Collatz.runOnce(n)
      break if n == 1
    end
  end

  def runWithPrint(n : UInt64)
    sysout = Array(UInt64).new
    while n = Collatz.runOnce(n)
      # Only display on 4sum even number
      if (n % 2 == 0 && Math.sumDigits(n) == 4)
        sysout << n
      end
      break if n == 1
    end
    sysout
  end
end
