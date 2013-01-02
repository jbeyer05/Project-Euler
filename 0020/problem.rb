
n = 1

(2..100).each do |i|
  n *= i
end

str = n.to_s
sum = 0

(0..(str.length - 1)).each do |i|
  sum += str[i] - '0'[0]
end

puts sum
