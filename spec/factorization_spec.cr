require "spec"
require "../src/factorization.cr"

describe Math do
  it "should calculate correctly primes" do
    Math.isPrime(-1).should eq(false)
    Math.isPrime(0).should eq(false)
    Math.isPrime(1).should eq(false)
    Math.isPrime(2).should eq(true)
    Math.isPrime(5).should eq(true)
    Math.isPrime(6).should eq(false)
  end
end
