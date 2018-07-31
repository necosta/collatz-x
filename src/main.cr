require "./lib.cr"

(Math::EqSolver.new).run

module Math
  class EqSolver
    iterations = 1

    def run
      a = Math.getA([1], 1)
      b = Math.getB([1], 1)
      c = Math.getC([0], 1)
      d = Math.getD([2], [0], 1)
      e = Math.getSum([1])
      f = Math.getSum([2])
      member = calcMemberEq(a, b, c, d)
      output = calcEq(member, e, f)
      puts "Output: #{output}"
    end

    def calcEq(sum : Float, exp3, exp2)
      sum / (1.0 * 3**exp3 / 2**exp2 - 1.0)
    end

    def calcMemberEq(a, b, c, d)
      1.0 * ((2**b * 3**c) - 3**a) / 2**d
    end
  end
end
