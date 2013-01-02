require 'pp'

i = 1
FACTORIAL =
{
  '0' => 1,
  '1' => 1,
  '2' => 2,
  '3' => 6,
  '4' => 24,
  '5' => 120,
  '6' => 720,
  '7' => 5040,
  '8' => 40320,
  '9' => 362880,
}

def sum_digit_factorials( i )
  sum = 0

  i.to_s.chars.to_a.each do |c|
    sum += FACTORIAL[c]
  end

  sum
end

(3..2550000).each do |i|
  if i == sum_digit_factorials( i )
    puts "#{i} is a special number"
  end
end
