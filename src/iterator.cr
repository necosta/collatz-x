require "./analysis"
require "./factorization"

module Math
  def calc(x, y, z, w)
    member = 0.0
    (1..x.size).each do |it|
      a = Analysis.getA(x, it)
      b = Analysis.getB(z, it)
      c = Analysis.getC(x, it)
      d = Analysis.getD(y, w, it)
      member = member + Analysis.getSumMember(a, b, c, d)
    end
    # Exploratory
    # num = Math.factorize((1.0 * 2**f * member).abs)
    # dem = Math.factorize((3**e - 2**f).abs)
    # puts "Num: #{num} || Dem: #{dem}"
    Analysis.getFinal(member, x.sum, y.sum)
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
    flows = Array(Array(Int32)).new
    flows << [1, 2, 1, 0]
    flows << [1, 4, 1, 0]
    (0..maxCycles).each do |x|
      flows << [x, x + 6, x, x + 1]
      flows << [x + 1, x + 6, x, x + 1]
      flows << [x + 1, x + 5, x + 1, x + 2]
      flows << [x + 2, x + 5, x + 1, x + 2]
      flows << [x + 1, x + 3, x + 1, x + 2]
      flows << [x + 2, x + 3, x + 1, x + 2]
    end
    flows
  end

  def genComplexInput(maxCycles, permutations)
    flows = genInput(maxCycles)
    flows.permutations(permutations)
  end
end
