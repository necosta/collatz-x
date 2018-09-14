require "big"

module Limits
  extend self

  def limit
    lim1 = 3.0/2**4
    lim2 = 3.0/2**8
    lim34 = sum(0, 12)
    lim56 = sum(1, 10)
    lim78 = sum(1, 6)
    lim1 + lim2 + lim34 + lim56 + lim78
  end

  def sum(m, l)
    out = 0.0
    iterations = 100
    (0..iterations).each do |n|
      out += memberInternal(n, m, l)
    end
    out
  end

  private def memberInternal(n, m, l)
    init = BigFloat.new(1)
    num = BigInt.new(3)**(n + m) + BigInt.new(3)**(n + m + 1)
    dem = BigInt.new(2)**(l + 2*n)
    init * num / dem
  end
end
