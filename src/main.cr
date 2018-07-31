(Math::EqSolver.new).run

module Math
  class EqSolver
    def run
      puts "Hello World!"
    end

    def calcEq(sum : Float, e, f)
      sum / (1.0 * 3**e / 2**f - 1.0)
    end
  end
end
