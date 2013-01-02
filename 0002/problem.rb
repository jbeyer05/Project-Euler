require 'pp'

fibs = [1,2]

while fibs.last < 4000000
  fibs << fibs[-1] + fibs[-2]
end

fibs.pop

sum = 0

fibs.each do |i|
  if i % 2 == 0
    sum += i
  end
end

puts sum
