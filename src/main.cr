require "./lib.cr"
require "./iterator.cr"

module Math
  def run(maxCycles, permutations)
    input = Math.genComplexInput(maxCycles, permutations)
    input.each do |i|
      out = parseInt(Math.iter(i))
      if (out > 0)
        puts "Input: #{i} => Output: #{out}"
      end
    end
  end

  def parseInt(input)
    # ToDo: Improve this logic
    input.to_i === input ? input.to_i : -1
  end
end
