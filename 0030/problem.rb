
N = 5
master_sum = 0

LOOKUP = {  '0' => 0, '1' => 1, '2' => 32, '3' => 243, '4' => 1024, '5' => 3125,
            '6' => 7776, '7' => 16807, '8' => 32768, '9' => 59049 }

def sum_digits( i )
  sum = 0

  i.to_s.chars.to_a.each do |c|
    sum += LOOKUP[c]
  end

  sum
end

(2..1000000).each do |i|
  sum = 0

  if sum_digits( i ) == i
    puts "#{i} is a special number"
    master_sum += i
  end
end

puts master_sum
