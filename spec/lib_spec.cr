require "spec"
require "../src/lib.cr"

describe Math do
  it "should calculate correctly a function" do
    input = [4, 6, 7]
    Math.getA(input, 1).should eq(17)
    Math.getA(input, 2).should eq(13)
    Math.getA(input, 3).should eq(7)

    input = [1, 1, 4, 5, 6]
    Math.getA(input, 1).should eq(17)
    Math.getA(input, 5).should eq(6)
  end

  it "should calculate correctly b function" do
    input = [4, 6, 7]
    Math.getB(input, 1).should eq(4)
    Math.getB(input, 2).should eq(6)
    Math.getB(input, 3).should eq(7)

    input = [1, 1, 4, 5, 6]
    Math.getB(input, 1).should eq(1)
    Math.getB(input, 5).should eq(6)
  end

  it "should calculate correctly c function" do
    input = [4, 6, 7]
    Math.getC(input, 1).should eq(13)
    Math.getC(input, 2).should eq(7)
    Math.getC(input, 3).should eq(0)

    input = [1, 1, 4, 5, 6]
    Math.getC(input, 1).should eq(16)
    Math.getC(input, 5).should eq(0)
  end

  it "should calculate correctly d function" do
    input1 = [3, 3]
    input2 = [2, 9]
    Math.getD(input1, input2, 1).should eq(5)
    Math.getD(input1, input2, 2).should eq(9)

    input1 = [4, 6, 7]
    input2 = [1, 2, 3]
    Math.getD(input1, input2, 1).should eq(14)
    Math.getD(input1, input2, 2).should eq(9)
    Math.getD(input1, input2, 3).should eq(3)
  end

  it "should calculate correctly sum function" do
    input = [40, 6, 7]
    Math.getSum(input).should eq(53)
  end
end
