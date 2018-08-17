require "spec"
require "../src/factorization.cr"

describe Math do
  it "should identify primes" do
    Math.prime?(-1).should eq(false)
    Math.prime?(0).should eq(false)
    Math.prime?(1).should eq(false)
    Math.prime?(2).should eq(true)
    Math.prime?(5).should eq(true)
    Math.prime?(6).should eq(false)
  end

  it "should compute primes" do
    Math.computePrimes(10).should eq([2, 3, 5, 7])
    Math.computePrimes(20).should eq([2, 3, 5, 7, 11, 13, 17, 19])
  end

  it "should factorize numbers" do
    Math.factorize(10).should eq([2, 5])
    Math.factorize(20).should eq([2, 2, 5])
    Math.factorize(54).should eq([2, 3, 3, 3])
    Math.factorize(33).should eq([3, 11])
    Math.factorize(238).should eq([2, 7, 17])
  end
end
