=begin

The positive integers, x, y, and z, are consecutive terms of an arithmetic progression. Given that n is a positive integer, the equation, x2  y2  z2 = n, has exactly one solution when n = 20:

132  102  72 = 20

In fact there are twenty-five values of n below one hundred for which the equation has a unique solution.

How many values of n less than fifty million have exactly one solution?

=end

#!/usr/bin/env ruby1.9

require 'pp'


N = 50_000_000

z = 1
t = Array.new( N, 0 )

while z < N
  addend = z / 3

  while true
    n = ( z + 2 * addend ) ** 2 - ( z + addend ) ** 2 - z ** 2
    break if n >= N
    addend += 1
    next if n < 0

    t[n] += 1
  end

  z += 1
end

cnt = 0

t.each do |t_ele|
  cnt += 1 if t_ele == 1
end

puts cnt

