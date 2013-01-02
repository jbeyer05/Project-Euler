require 'pp'

N      = 10**3

def gcd( a, b )
  c = 0
#  pp [a,b]

  while a > 0
    c = b % a
    b = a
    a = c

#    pp [a,b,c]
  end

#  puts
  b
end


count = 0

(2..N).each do |denom|
  step = ( denom % 2 == 0 ) ? 2 : 1

  (1..(( denom - 1 ) / 2 )).step( step ) do |num|
    count += 2 if gcd( num, denom ) == 1
  end
end

puts count
