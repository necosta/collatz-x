(Math::EqSolver.new).run

module Math
  class EqSolver
    iterations = 1

    def run
      a = 1
      b = 1
      c = 0
      d = 0
      e = 1
      f = 2
      sum = getSum(a, b, c, d)
      output = calcEq(sum, e, f)
      puts "Output: #{output}"
    end

    def calcEq(sum : Float, exp3, exp2)
      sum / (1.0 * 3**exp3 / 2**exp2 - 1.0)
    end

    def getSum(a, b, c, d)
      1.0 * ((2**b * 3**c) - 3**a) / 2**d
    end
  end
end
