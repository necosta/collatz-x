require "./lib.cr"

module Math
  def calc(x, y, z, w)
    e = Math.getSum(x)
    f = Math.getSum(y)

    member = 0.0
    (1..x.size).each do |it|
      a = Math.getA(x, it)
      b = Math.getB(z, it)
      c = Math.getC(x, it)
      d = Math.getD(y, w, it)
      member = member + Math.calcMemberEq(a, b, c, d)
    end
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
    (0..maxCycles).each do |x|
      flows << [[x, x + 6, x, x + 1]]
      flows << [[x + 1, x + 6, x, x + 1]]
      flows << [[x + 1, x + 5, x + 1, x + 2]]
      flows << [[x + 2, x + 5, x + 1, x + 2]]
      flows << [[x + 1, x + 3, x + 1, x + 2]]
      flows << [[x + 2, x + 3, x + 1, x + 2]]
    end
    flows
  end

  def genComplexInput(maxCycles)
    flows = genInput(maxCycles)
    out = Array(Array(Int32)).new
    flows.each_permutation(2) { |p|
      arr = Array(Array(Int32)).new
      arr << p[0][0]
      arr << p[1][0]
      flows << arr
    }
    flows.uniq
  end
end