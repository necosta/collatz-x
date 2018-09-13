require "./spec_helper"
require "../src/iterator"

describe Iterator do
  it "should calculate a full iteration" do
    x = [1]; y = [2]; z = [1]; w = [0]
    Iterator.calc(x, y, z, w).should eq (4.0)
    x = [1, 1]; y = [3, 2]; z = [1, 1]; w = [2, 0]
    Iterator.calc(x, y, z, w).to_f.should eq (1.652173913043478)
    x = [21, 1]; y = [23, 2]; z = [21, 1]; w = [22, 0]
    Iterator.calc(x, y, z, w).to_f.should eq (-2.002809805230198)
  end

  it "should pivot transform input" do
    input = [[1, 2, 1, 0]]
    Iterator.pivotInput(input, 1).should eq ([2])
    Iterator.pivotInput(input, 2).should eq ([1])

    input = [[1, 2, 1, 0], [1, 4, 1, 0]]
    Iterator.pivotInput(input, 1).should eq ([2, 4])
    Iterator.pivotInput(input, 3).should eq ([0, 0])
  end

  it "should generate flows input" do
    Iterator.genFlows(-1).should eq ([[1, 2, 1, 0], [1, 4, 1, 0]])
    Iterator.genFlows(0).size.should eq (8)
    Iterator.genFlows(1).size.should eq (14)
  end

  it "should generate aggregated flows for iteration" do
    Iterator.genAggFlows(-1, 2).should eq ([[[1, 2, 1, 0], [1, 4, 1, 0]], [[1, 4, 1, 0], [1, 2, 1, 0]]])
    Iterator.genAggFlows(-1, 2).size.should eq(2)
    Iterator.genAggFlows(0, 2).size.should eq(56)
    Iterator.genAggFlows(1, 2).size.should eq(178)
  end
end
