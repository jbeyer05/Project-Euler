
N = 15

def recurse( digits_remaining, cur_digit, str )
#  puts "#{str}" if digits_remaining == 0
#  puts "#{str.to_s.reverse}" if digits_remaining == 0
  return 1 if digits_remaining == 0

  sum = 0

  (cur_digit+1..9).each do |digit|
    digits_remaining.downto( 1 ) do |num_digits|
      sum += recurse( digits_remaining - num_digits, digit, str + ( digit.to_s * num_digits ))
    end
  end

#  puts "#{sum} combinations with #{digits_remaining} digits remaining and starting w #{cur_digit}"
  sum
end

sum = 0
(1..N).each do |n|
  new = 2 * recurse( n, -1, '' )
  sum += new
  puts new
  puts
end

puts
puts sum
