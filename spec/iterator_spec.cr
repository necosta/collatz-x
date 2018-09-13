require "spec"
require "../src/iterator"

describe Math do
  it "should calculate a full iteration" do
    x = [1]; y = [2]; z = [1]; w = [0]
    Math.calc(x, y, z, w).should eq (4.0)
    x = [1, 1]; y = [3, 2]; z = [1, 1]; w = [2, 0]
    Math.calc(x, y, z, w).to_f.should eq (1.652173913043478)
    x = [21, 1]; y = [23, 2]; z = [21, 1]; w = [22, 0]
    Math.calc(x, y, z, w).to_f.should eq (-2.002809805230198)
  end

  it "should pivot transform input" do
    input = [[1, 2, 1, 0]]
    Math.pivotInput(input, 1).should eq ([2])
    Math.pivotInput(input, 2).should eq ([1])

    input = [[1, 2, 1, 0], [1, 4, 1, 0]]
    Math.pivotInput(input, 1).should eq ([2, 4])
    Math.pivotInput(input, 3).should eq ([0, 0])
  end

  it "should generate transform input" do
    Math.genInput(-1).should eq ([[1, 2, 1, 0], [1, 4, 1, 0]])
    Math.genInput(0).size.should eq (8)
  end

  it "should generate complex transform input" do
    Math.genComplexInput(-1, 2).should eq ([[[1, 2, 1, 0], [1, 4, 1, 0]], [[1, 4, 1, 0], [1, 2, 1, 0]]])
    Math.genComplexInput(-1, 2).size.should eq(2)
    Math.genComplexInput(0, 2).size.should eq(56)
    Math.genComplexInput(1, 2).size.should eq(182)
  end
end
