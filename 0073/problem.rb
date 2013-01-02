require 'pp'

N = 12*10**3

def gcd( a, b )
  c = 0

  while a > 0
    c = b % a
    b = a
    a = c
  end

  b
end


count = 0

(1..N).each do |denom|
#  ratio = lcm / denom
  even = denom % 2 == 0

  step = even ? 2 : 1

  start = ( denom / 3 ) - 1
  start -= 1 if start % 2 == 0

  (start..denom-1).step( step ) do |num|

    fraction = num.to_f / denom
    break if fraction > 1.0 / 2

#    temp = num * ratio
#    count += 1 if temp < upper_bound && temp > lower_bound && denom.gcd( num ) == 1

    count += 1 if fraction > 1.0 / 3 && gcd( denom, num ) == 1
  end

  puts denom if denom % 10 == 0
end

puts count
