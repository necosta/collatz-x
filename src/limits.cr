require "big/big_int"

module Limits
  extend self

  def limit
    out = 3.0/2**4 + 3.0/2**8 + sum(0, 12) + sum(1, 10) + sum(1, 6)
    # puts "#{out}"
    out
  end

  def sum(m, l)
    out = 0.0
    iterations = 100
    (0..iterations).each do |n|
      out = out + memberInternal(n, m, l)
    end
    # puts "#{out}"
    out
  end

  private def memberInternal(n, m, l)
    init = BigFloat.new(1)
    num = BigInt.new(3)**(n + m) + BigInt.new(3)**(n + m + 1)
    dem = BigInt.new(2)**(l + 2*n)
    init * num / dem
  end
end
