=begin

A spider, S, sits in one corner of a cuboid room, measuring 6 by 5 by 3, and a fly, F, sits in the opposite corner. By travelling on the surfaces of the room the shortest "straight line" distance from S to F is 10 and the path is shown on the diagram.


However, there are up to three "shortest" path candidates for any given cuboid and the shortest route is not always integer.

By considering all cuboid rooms with integer dimensions, up to a maximum size of M by M by M, there are exactly 2060 cuboids for which the shortest distance is integer when M=100, and this is the least value of M for which the number of solutions first exceeds two thousand; the number of solutions is 1975 when M=99.

Find the least value of M such that the number of solutions first exceeds one million.

=end

require 'pp'

MAX_CUBOIDS = 100_000
MAX_M       = 2_000
MAX_SQUARE  = MAX_M ** 2 + ( MAX_M + MAX_M ) ** 2

m   = 1
cnt = 0
max_min_square = 0

$squares = {}

# generate a hash of all squares that we might need to check
i = 1
while i**2 < MAX_SQUARE
  $squares[i**2] = 1
  i += 1
end

puts "DONE SQUARES"

while true
  a2 = m*m
  (1..m).each do |b|
    (b..m).each do |c|
      min_square = a2 + ( b + c ) ** 2

      if $squares[min_square]
        cnt += 1
      end
    end
  end

  break if cnt > MAX_CUBOIDS

  m += 1
end

puts m
