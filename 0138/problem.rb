=begin
Consider the isosceles triangle with base length, b = 16, and legs, L = 17.


By using the Pythagorean theorem it can be seen that the height of the triangle, h = (17^2 8^2) = 15, which is one less than the base length.

With b = 272 and L = 305, we get h = 273, which is one more than the base length, and this is the second smallest isosceles triangle with the property that h = b +- 1.

Find summation( L ) for the twelve smallest isosceles triangles for which h = b +- 1 and b, L are positive integers.
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

$cnt = Array.new( L+1, 0 )
last_diff = nil

max_n = ( L/2 ) ** 0.5
(1..max_n).each do |n|
  max_m = ( L/2 - n*n ) ** 0.5

  m = n + 1
  while m <= max_m
#  ((n + 1)..max_m).each do |m|
    if ! (( m % 2 == 1 && n % 2 == 0 ) || ( m % 2 == 0 && n % 2 == 1 )) # skip this one become we need precisely one of m and n to be odd
      m += 1
      next
    end

    if gcd( m, n ) == 1
      a  = m*m - n*n
      # b2 = base = 2x side b
      b2 = 2 * ( 2 * m * n )
      c  = m*m + n*n

      puts '***' + [m,n,a,b2/2,(a-b2).abs].join( ',' ) if (a-b2).abs == 1

=begin
      if last_diff && ( a - b2 ).abs > last_diff
        puts "BREAKING HERE"
        m = max_m + 1
        last_diff = nil
      else
        last_diff = ( a - b2 ).abs
      end
=end

      if b2 == a + 1 || b2 == a - 1
        puts "--- #{a},#{ b2 / 2 },#{c}  #{n},#{m}"
      end
    end

    m += 1
  end
end

