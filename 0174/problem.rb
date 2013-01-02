=begin

We shall define a square lamina to be a square outline with a square "hole" so that the shape possesses vertical and horizontal symmetry.

Given eight tiles it is possible to form a lamina in only one way: 3x3 square with a 1x1 hole in the middle. However, using thirty-two tiles it is possible to form two distinct laminae.


If t represents the number of tiles used, we shall say that t = 8 is type L(1) and t = 32 is type L(2).

Let N(n) be the number of t  1000000 such that t is type L(n); for example, N(15) = 832.

What is  N(n) for 1  n  10?

=end

#!/usr/bin/env ruby1.9

require 'pp'


N = 1_000_000

max_l = N / 4 + 1
cnt   = 0
t     = Array.new( N + 1, 0 )

(3..max_l).each do |l|
  hole_l = l - 2

  while hole_l >= 1 && l*l - hole_l*hole_l <= N
    t[l*l-hole_l*hole_l] += 1
    hole_l -= 2
  end
end

t.each do |t_ele|
  cnt += 1 if t_ele >= 1 && t_ele <= 10
end

puts cnt

