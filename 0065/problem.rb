require 'pp'

N = 99

continued_fraction = []
(1..N/3+1).each do |i|
  continued_fraction += [1,2*i,1]
end

num   = 1
denom = continued_fraction[N-1]
n     = N - 2


while n >= 0
  num  += continued_fraction[n] * denom
  temp  = num
  num   = denom
  denom = temp

  n -= 1
end

num += 2 * denom
gcd = num.gcd( denom )

num   /= gcd
denom /= gcd

pp [num,denom]

sum = 0
num.to_s.each_char do |c|
  sum += c.to_i
end

puts sum
