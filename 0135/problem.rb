=begin

Given the positive integers, x, y, and z, are consecutive terms of an arithmetic progression, the least value of the positive integer, n, for which the equation,
x^2 - y^2 - z^2 = n, has exactly two solutions is n = 27:

34^2 - 27^2 - 20^2 = 12^2 - 9^2 - 6^2 = 27

It turns out that n = 1155 is the least value which has exactly ten solutions.

How many values of n less than one million have exactly ten distinct solutions?

=end

#!/usr/bin/env ruby1.9

require 'pp'


N = 1_000_000

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
  cnt += 1 if t_ele == 10
end

puts cnt

