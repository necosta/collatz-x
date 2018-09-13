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
    sysout = Array(BigInt).new
    while n = Collatz.runOnce(n)
      # Only display on 4sum even number
      if (n % 2 == 0 && Math.sumDigits(n) == 4)
        sysout << n
      end
      break if n == 1
    end
    sysout
  end

  def runWithSpecialIterationsCount(n)
    counter = 0
    while n = Collatz.runOnce(n)
      if (n % 2 == 1 && Math.sumDigits(n) == 8)
        counter = counter + 1
      end
      break if n == 1
    end
    counter
  end
end
