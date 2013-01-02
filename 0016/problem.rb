
str = ( 2 ** 1000 ).to_s

sum = 0

(0..(str.length - 1)).each do |i|
  sum += str[i] - '0'[0]
end

puts sum
