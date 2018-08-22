require "./iterator"

module Math
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
end
