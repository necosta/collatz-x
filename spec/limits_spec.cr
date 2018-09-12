require "spec"
require "../src/limits"

describe Limits do
  it "should calculate limit functions" do
    Limits.sum(0, 12).should be < (0.04)
    Limits.sum(1, 10).should be < (0.05)
    Limits.sum(1, 6).should be < (0.8)
    Limits.limit.should be < (1.0)
  end
end
