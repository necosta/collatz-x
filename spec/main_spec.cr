require "spec"
require "../src/main.cr"
require "../src/lib.cr"

describe Math do
  it "should calculate correctly" do
    Math.calcEq(-1.0, 1, 2).should eq(4.0)

    Math.calcMemberEq(1, 1, 0, 0).should eq(-1.0)
  end

  it "should parse float to int" do
    Math.parseInt(3.4).should eq(-1)
    Math.parseInt(5.0).should eq(5)
    Math.parseInt(5.0001).should eq(-1)
  end
end
