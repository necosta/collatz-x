require "./spec_helper"
require "../src/collatz"

describe Collatz do
  it "should run Collatz methods" do
    Collatz.runOnce(10).should eq 5
    Collatz.runOnce(11).should eq 34
    Collatz.runOnce(110).should eq 55
    Collatz.runOnce(99).should eq 298
    Collatz.runWithPrint(4).should eq [] of BigInt
    Collatz.runWithPrint(40).should eq [{BigInt.new(4), "ABIDEF"}]
    Collatz.runWithPrint(53).map { |a| a[0] }.should eq [40, 4]
    Collatz.runWithPrint(100).map { |a| a[0] }.should eq [76, 58, 22, 40, 4]
    Collatz.runFast(1000).should eq nil
  end
end
