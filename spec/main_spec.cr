require "spec"
require "../src/lib.cr"

describe Math do
  it "should calculate correctly" do
    Math.calcEq(-1.0, 1, 2).should eq(4.0)

    Math.calcMemberEq(1, 1, 0, 0).should eq(-1.0)
  end
end
