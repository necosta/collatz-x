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
end
