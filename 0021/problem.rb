require 'pp'

d = {}

(1..10000).each do |i|
  sum = 0

  (1..(i/2)).each do |j|
    if i % j == 0
      sum += j
    end
  end

  d[i] = sum
end

sum = 0

(1..10000).each do |i|
  if d[d[i]] == i && d[i] != i
    puts i
    sum += i
  end
end

puts sum
