=begin

Let (a, b, c) represent the three sides of a right angle triangle with integral length sides. It is possible to place four such triangles together to form a square with length c.

For example, (3, 4, 5) triangles can be placed together to form a 5 by 5 square with a 1 by 1 hole in the middle and it can be seen that the 5 by 5 square can be tiled with twenty-five 1 by 1 squares.


However, if (5, 12, 13) triangles were used then the hole would measure 7 by 7 and these could not be used to tile the 13 by 13 square.

Given that the perimeter of the right triangle is less than one-hundred million, how many Pythagorean triangles would allow such a tiling to take place?

=end

=begin

Used generators m and n, where a = m^2 - n^2, b = 2 * m * n, c = m^2 + n^2, where m and n are co-prime and one is odd

=end


require 'pp'

L = 100_000_000

def gcd( a, b )
  c = 0

  while a > 0
    c = b % a
    b = a
    a = c
  end

  b
end

$cnt = 0

max_n = ( L/2 ) ** 0.5
(1..max_n).each do |n|
  max_m = ( L/2 - n*n ) ** 0.5

  ((n + 1)..max_m).each do |m|
    next if ! (( m % 2 == 1 && n % 2 == 0 ) || ( m % 2 == 0 && n % 2 == 1 )) # skip this one become we need precisely one of m and n to be odd

    if gcd( m, n ) == 1
      a = m*m - n*n
      b = 2 * m * n
      c = m*m + n*n

      hole_size = c * c - 2 * a * b
      if ( c * c ) % hole_size == 0
        l = a + b + c

        l.step( L, l ) do |l2|
          $cnt += 1
        end
      end
    end
  end
end

puts $cnt

