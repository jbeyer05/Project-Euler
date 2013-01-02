
N = 7830457
M = 10000

x = 1

0.step( N - M, M ) do |n|
  x *= 2**M
  x %= 10**11
end

x *= 2**(N%M)
x %= 10**11

x = 28433 * x + 1

puts x
