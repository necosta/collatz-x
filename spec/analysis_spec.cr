require "./spec_helper"
require "../src/analysis"

describe Analysis do
  it "should calculate final equations" do
    Analysis.getSumMember(1, 1, 0, 0).should eq(-1.0)
    Analysis.getSumMember(1, 4, 0, 0).should eq(13.0)
    Analysis.getTotal(-1.0, 1, 2).should eq(4.0)

    actual = Analysis.getTotal(-1.0, 1, 4).to_f
    expected = 16.0/13.0
    (actual - expected).abs.should be < (1e-10)

    Analysis.getTotal(BigInt.new("123456789123456789123456789"), 50, 20).to_f.should eq(180323428.023709719368)
  end

  it "should calculate A function" do
    input = [4, 6, 7]
    Analysis.getA(input, 1).should eq(17)
    Analysis.getA(input, 2).should eq(13)
    Analysis.getA(input, 3).should eq(7)

    input = [1, 1, 4, 5, 6]
    Analysis.getA(input, 1).should eq(17)
    Analysis.getA(input, 5).should eq(6)
  end

  it "should calculate B function" do
    input = [4, 6, 7]
    Analysis.getB(input, 1).should eq(4)
    Analysis.getB(input, 2).should eq(6)
    Analysis.getB(input, 3).should eq(7)

    input = [1, 1, 4, 5, 6]
    Analysis.getB(input, 1).should eq(1)
    Analysis.getB(input, 5).should eq(6)
  end

  it "should calculate C function" do
    input = [4, 6, 7]
    Analysis.getC(input, 1).should eq(13)
    Analysis.getC(input, 2).should eq(7)
    Analysis.getC(input, 3).should eq(0)

    input = [1, 1, 4, 5, 6]
    Analysis.getC(input, 1).should eq(16)
    Analysis.getC(input, 5).should eq(0)
  end

  it "should calculate D function" do
    input1 = [3, 3]
    input2 = [2, 9]
    Analysis.getD(input1, input2, 1).should eq(5)
    Analysis.getD(input1, input2, 2).should eq(9)

    input1 = [4, 6, 7]
    input2 = [1, 2, 3]
    Analysis.getD(input1, input2, 1).should eq(14)
    Analysis.getD(input1, input2, 2).should eq(9)
    Analysis.getD(input1, input2, 3).should eq(3)
  end
end
