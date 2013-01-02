require 'pp'

N = 10**8

class Array
  def sum
    sum = 0

    self.each do |i|
      sum += i
    end

    sum
  end
end

$squares = [0]

i = 1

while i*i < N
  $squares << i*i
  i += 1
end

master_sum = 0
used_numbers = {}

(2..$squares.length).each do |run_length|
  (1..$squares.length-run_length-1).each do |start|
    sum = $squares[start,run_length].sum

    break if sum > N

    if sum == sum.to_s.reverse.to_i && ! used_numbers[sum]
      puts sum
      master_sum += sum
      used_numbers[sum] = true
    end
  end
end

puts
puts master_sum
