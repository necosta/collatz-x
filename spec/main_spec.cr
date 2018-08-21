require "spec"
require "../src/main.cr"
require "../src/lib.cr"

describe Math do
  it "should calculate correctly" do
    Math.calcEq(-1.0, 1, 2).should eq(4.0)

    Math.calcMemberEq(1, 1, 0, 0).should eq(-1.0)
  end

  it "should parse float to int" do
    Math.isWholeNumber?(3.4).should be_false
    Math.isWholeNumber?(5.0).should be_true
    Math.isWholeNumber?(5.0001).should be_false
    Math.isWholeNumber?(10).should be_true
  end

  it "should parse float to int" do
    Math.sumDigits(111).should eq(3)
    Math.sumDigits(777).should eq(3)
    Math.sumDigits(999999999999).should eq(9)
  end
end
