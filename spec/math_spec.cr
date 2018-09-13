require "./spec_helper"
require "../src/math"

describe Math do
  it "should identify whole numbers" do
    Math.isWholeNumber?(3.4).should be_false
    Math.isWholeNumber?(5.0).should be_true
    Math.isWholeNumber?(5.0001).should be_false
    Math.isWholeNumber?(10).should be_true
    Math.isWholeNumber?(BigFloat.new("99999999999999999999999.0")).should be_true
    Math.isWholeNumber?(BigFloat.new("1221.00000001")).should be_false
    Math.isWholeNumber?(BigFloat.new("12.00000000000000000001")).should be_true
  end

  it "should sum all digits recursively" do
    Math.digitsSum(111).should eq(3)
    Math.digitsSum(777).should eq(3)
    Math.digitsSum(999999999999).should eq(9)
    Math.digitsSum(123456789555).should eq(6)
    Math.digitsSum(322878).should eq(3)
    Math.digitsSum(BigInt.new("99999999999999999999999999999999999999999999999999")).should eq(9)
  end
end
