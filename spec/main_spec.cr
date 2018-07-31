require "spec"
require "../src/main.cr"

describe Math do
  it "should calculate correctly" do
    eqSolver = Math::EqSolver.new

    eqSolver.calcEq(-1.0, 1, 2).should eq(4.0)
  end
end
