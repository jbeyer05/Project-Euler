=begin

It is easily proved that no equilateral triangle exists with integral length sides and integral area. However, the almost equilateral triangle 5-5-6 has an area of 12 square units.

We shall define an almost equilateral triangle to be a triangle for which two sides are equal and the third differs by no more than one unit.

Find the sum of the perimeters of all almost equilateral triangles with integral side lengths and area and whose perimeters do not exceed one billion (1,000,000,000).

=end

require 'pp'

N = 1_000_000_000
N = 10_000_000
MAX_SQUARE = 5E16
e_s = 1 # equal side
sum = 0


def square?( i )
  temp = i ** 0.5
  temp.to_i == temp
end


max_e_s = ( N - 1 ) / 3

while e_s < max_e_s
  e_s2 = e_s * e_s

  s_s = e_s + 1
  s_s2 = s_s * s_s
  area_squared_times_16 = s_s2 * ( 4 * e_s2 - s_s2 )

  if area_squared_times_16 % 16 == 0 && square?( area_squared_times_16/16 )
    sum += e_s * 2 + s_s
    puts "#{e_s},#{s_s}"
  end

  s_s = e_s - 1
  s_s2 = s_s * s_s
  area_squared_times_16 = s_s2 * ( 4 * e_s2 - s_s2 )

  if area_squared_times_16 % 16 == 0 && square?( area_squared_times_16/16 )
    sum += e_s * 2 + s_s
    puts "#{e_s},#{s_s}"
  end

  e_s += 1
end

puts sum
