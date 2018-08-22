require "spec"
require "../src/math"

describe Math do
  it "should identify whole numbers" do
    Math.isWholeNumber?(3.4).should be_false
    Math.isWholeNumber?(5.0).should be_true
    Math.isWholeNumber?(5.0001).should be_false
    Math.isWholeNumber?(10).should be_true
  end

  it "should sum all digits" do
    Math.sumDigits(111).should eq(3)
    Math.sumDigits(777).should eq(3)
    Math.sumDigits(999999999999).should eq(9)
    Math.sumDigits(123456789555).should eq(6)
  end
end
