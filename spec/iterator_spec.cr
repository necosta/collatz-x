require "spec"
require "../src/iterator.cr"

describe Math do
  it "should calculate correctly a full iteration" do
    x = [1]; y = [2]; z = [1]; w = [0]
    Math.calc(x, y, z, w).should eq (4.0)
  end

  it "should calculate transform input" do
    input = [[1, 2, 1, 0]]
    Math.pivotInput(input, 1).should eq ([2])
    Math.pivotInput(input, 2).should eq ([1])

    input = [[1, 2, 1, 0], [1, 4, 1, 0]]
    Math.pivotInput(input, 1).should eq ([2, 4])
    Math.pivotInput(input, 3).should eq ([0, 0])
  end

  it "should calculate transform input" do
    Math.genInput(-1).should eq ([[[1, 2, 1, 0]], [[1, 4, 1, 0]]])
    Math.genInput(0).size.should eq (8)
  end
end
