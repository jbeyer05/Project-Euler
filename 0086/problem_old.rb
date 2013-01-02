=begin

A spider, S, sits in one corner of a cuboid room, measuring 6 by 5 by 3, and a fly, F, sits in the opposite corner. By travelling on the surfaces of the room the shortest "straight line" distance from S to F is 10 and the path is shown on the diagram.


However, there are up to three "shortest" path candidates for any given cuboid and the shortest route is not always integer.

By considering all cuboid rooms with integer dimensions, up to a maximum size of M by M by M, there are exactly 2060 cuboids for which the shortest distance is integer when M=100, and this is the least value of M for which the number of solutions first exceeds two thousand; the number of solutions is 1975 when M=99.

Find the least value of M such that the number of solutions first exceeds one million.

=end

require 'pp'

MAX_CUBOIDS = 20_000

m   = 1
cnt = 0

while true
  (1..m).each do |a|
    a2 = a*a

    (a..m).each do |b|
      b2  = b*b
      ab2 = ( a + b ) ** 2

      min_b = b
      min_b = m if a < m && b < m
      (min_b..m).each do |c|
        next if a < m && b < m && c < m

        min_square = [a2 + ( b + c ) ** 2, b2 + ( a + c ) ** 2, c*c + ab2].min

        if ( min_square ** 0.5 ).to_i == min_square ** 0.5
#          puts "FOUND ONE FOR #{a},#{b},#{c}"
          cnt += 1
        end
      end
    end
  end

  break if cnt > MAX_CUBOIDS

  m += 1
end

puts m
