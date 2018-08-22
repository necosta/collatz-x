require "./lib"
require "./iterator"

module Math
  def runCollatz(input)
    if (input % 2 == 0)
      input / 2
    else
      input * 3 + 1
    end
  end

  def runAnalysis(maxCycles, permutations)
    input = Math.genComplexInput(maxCycles, permutations)
    out = Array(Tuple(Array(Array(Int32)), Int32)).new
    input.each do |i|
      temp = Math.iter(i)
      if (isWholeNumber?(temp) && temp > 0)
        out << {i, temp.to_i}
      end
    end
    out
  end

  def isWholeNumber?(input)
    input.to_i === input
  end

  def sumDigitsInternal(input)
    out = 0
    input.to_s.each_char do |c|
      out = out + c.to_i
    end
    out
  end

  def sumDigits(input)
    output = input
    while output = sumDigitsInternal(output)
      break if output < 10
    end
    output
  end
end
