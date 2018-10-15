require "./spec_helper"
require "../src/limits"

describe Limits do
  it "should calculate limit functions" do
    Limits.sum(0, 12).should be < 1.0/256
    Limits.sum(1, 10).should be < 3.0/64
    Limits.sum(1, 6).should be < 3.0/4
    Limits.limit.should be < 1.0
  end
end
