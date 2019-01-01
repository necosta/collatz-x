require "./spec_helper"
require "../src/iterator"

describe Iterator do
  it "should calculate a full iteration" do
    Iterator.init(100, 1)
    x = [1]; y = [2]; z = [1]; w = [0]
    Iterator.calc(x, y, z, w).should eq 4.0
    x = [1]; y = [4]; z = [1]; w = [0]
    (Iterator.calc(x, y, z, w) - 16.0/13).should be < 0.0001
    x = [1, 1]; y = [3, 2]; z = [1, 1]; w = [2, 0]
    Iterator.calc(x, y, z, w).to_f.should eq 1.652173913043478
    x = [21, 1]; y = [23, 2]; z = [21, 1]; w = [22, 0]
    Iterator.calc(x, y, z, w).to_f.should eq -2.002809805230198
  end

  it "should pivot input" do
    input = [[1, 2, 1, 0]]
    Iterator.pivotInput(input, 1).should eq [2]
    Iterator.pivotInput(input, 2).should eq [1]

    input = [[1, 2, 1, 0], [1, 4, 1, 0]]
    Iterator.pivotInput(input, 0).should eq [1, 1]
    Iterator.pivotInput(input, 1).should eq [2, 4]
    Iterator.pivotInput(input, 3).should eq [0, 0]
  end

  it "should generate flows list" do
    Iterator.genFlows(-1).should eq [[1, 2, 1, 0], [1, 4, 1, 0]]
    Iterator.genFlows(0).size.should eq 8
    Iterator.genFlows(1).size.should eq 14
    Iterator.genFlows(2).size.should eq 20
  end

  it "should calculate sum function" do
    Iterator.getSumMember(0, 1, 0, 1).should eq(0.5)
    Iterator.getSumMember(1, 1, 1, 1).should eq(1.5)
    Iterator.getSumMember(2, 0, 1, 3).should eq(-0.75)
  end

  it "should calculate A function" do
    input = [4, 6, 7]
    Iterator.getA(input, 1).should eq(17)
    Iterator.getA(input, 2).should eq(13)
    Iterator.getA(input, 3).should eq(7)

    input = [1, 1, 4, 5, 6]
    Iterator.getA(input, 1).should eq(17)
    Iterator.getA(input, 5).should eq(6)
  end

  it "should calculate B function" do
    input = [4, 6, 7]
    Iterator.getB(input, 1).should eq(4)
    Iterator.getB(input, 2).should eq(6)
    Iterator.getB(input, 3).should eq(7)

    input = [1, 1, 4, 5, 6]
    Iterator.getB(input, 1).should eq(1)
    Iterator.getB(input, 5).should eq(6)
  end

  it "should calculate C function" do
    input = [4, 6, 7]
    Iterator.getC(input, 1).should eq(13)
    Iterator.getC(input, 2).should eq(7)
    Iterator.getC(input, 3).should eq(0)

    input = [1, 1, 4, 5, 6]
    Iterator.getC(input, 1).should eq(16)
    Iterator.getC(input, 5).should eq(0)
  end

  it "should calculate D function" do
    input1 = [3, 3]
    input2 = [2, 9]
    Iterator.getD(input1, input2, 1).should eq(5)
    Iterator.getD(input1, input2, 2).should eq(9)

    input1 = [4, 6, 7]
    input2 = [1, 2, 3]
    Iterator.getD(input1, input2, 1).should eq(14)
    Iterator.getD(input1, input2, 2).should eq(9)
    Iterator.getD(input1, input2, 3).should eq(3)
  end
end
