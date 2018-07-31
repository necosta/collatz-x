require "spec"
require "../src/iterator.cr"

describe Math do
  it "should calculate correctly a full iteration" do
    x = [1]; y = [2]; z = [1]; w = [0]
    Math.calc(x, y, z, w).should eq (4.0)
  end
end
