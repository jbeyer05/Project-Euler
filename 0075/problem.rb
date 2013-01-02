=begin
It turns out that 12 cm is the smallest length of wire that can be bent to form an integer sided right angle triangle in exactly one way, but there are many more examples.

12 cm: (3,4,5)
24 cm: (6,8,10)
30 cm: (5,12,13)
36 cm: (9,12,15)
40 cm: (8,15,17)
48 cm: (12,16,20)

In contrast, some lengths of wire, like 20 cm, cannot be bent to form an integer sided right angle triangle, and other lengths allow more than one solution to be found; for example, using 120 cm it is possible to form exactly three different integer sided right angle triangles.

120 cm: (30,40,50), (20,48,52), (24,45,51)

Given that L is the length of the wire, for how many values of L  1,500,000 can exactly one integer sided right angle triangle be formed?
=end


=begin
Used generators m and n, where a = m^2 - n^2, b = 2 * m * n, c = m^2 + n^2, where m and n are co-prime and one is odd
=end


require 'pp'

L = 1_500_000

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

max_n = ( L/2 ) ** 0.5
(1..max_n).each do |n|
  max_m = ( L/2 - n*n ) ** 0.5

  ((n + 1)..max_m).each do |m|
    next if ! (( m % 2 == 1 && n % 2 == 0 ) || ( m % 2 == 0 && n % 2 == 1 )) # skip this one become we need precisely one of m and n to be odd

    if gcd( m, n ) == 1
      a = m*m - n*n
      b = 2 * m * n
      c = m*m + n*n

      l = a + b + c

      l.step( L, l ) do |l2|
        $cnt[l2] += 1
      end
    end
  end
end

total = 0

$cnt.each_index do |i|
  if $cnt[i] == 1
    total += 1
  end
end

puts total

