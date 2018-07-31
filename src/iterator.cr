require "./lib.cr"

module Math
  def calc(x, y, z, w)
    a = Math.getA(x, 1)
    b = Math.getB(z, 1)
    c = Math.getC(w, 1)
    d = Math.getD(y, w, 1)
    e = Math.getSum(x)
    f = Math.getSum(y)
    member = Math.calcMemberEq(a, b, c, d)
    Math.calcEq(member, e, f)
  end

  def iter(input : Array(Array(Int32)))
    x = pivotInput(input, 0)
    y = pivotInput(input, 1)
    z = pivotInput(input, 2)
    w = pivotInput(input, 3)
    Math.calc(x, y, z, w)
  end

  def pivotInput(input : Array(Array(Int32)), pos)
    out = Array(Int32).new
    input.each do |array|
      out << array[pos]
    end
    out
  end

  def genInput(maxCycles)
    flows = Array(Array(Array(Int32))).new
    flows << [[1, 2, 1, 0]]
    flows << [[1, 4, 1, 0]]
    # flows << [[1, 2, 1, 0], [1, 4, 1, 0]]
    (0..maxCycles).each do |x|
      flows << [[x, x + 6, x, x + 1]]
      flows << [[x + 1, x + 6, x, x + 1]]
      flows << [[x + 1, x + 5, x + 1, x + 2]]
      flows << [[x + 2, x + 5, x + 1, x + 2]]
      flows << [[x + 1, x + 3, x + 1, x + 2]]
      flows << [[x + 2, x + 3, x + 1, x + 2]]
    end
    puts "Size: #{flows.size}"
    flows
  end
end
