require 'pp'

N = 10 ** 7

divisors = Array.new( N + 1, 0 )

(1..N/2).each do |divisor|
  (1..N/divisor).each do |i|
    divisors[divisor*i] += 1
  end
end

count = 0

divisors.each_index do |i|
  next if i == divisors.length - 1
  if divisors[i] == divisors[i+1]
    count += 1
  end
end

puts count
