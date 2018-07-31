require "./lib.cr"
require "./iterator.cr"

module Math
  def runWithValues
    a = Math.getA([1], 1)
    b = Math.getB([1], 1)
    c = Math.getC([0], 1)
    d = Math.getD([2], [0], 1)
    e = Math.getSum([1])
    f = Math.getSum([2])
    member = Math.calcMemberEq(a, b, c, d)
    output = Math.calcEq(member, e, f)
    puts "Output: #{output}"
  end

  def run(maxCycles)
    input = Math.genComplexInput(maxCycles)
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
