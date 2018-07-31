require "./lib.cr"

Math.runWithValues

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
end
