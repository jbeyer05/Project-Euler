
def palindromic_10?( i )
  i.to_s == i.to_s.reverse
end

def palindromic_2?( i )
  b_str = ''

  (0..24).each do |bit|
    b_str += i[bit].to_s
  end

  b_str.reverse!
  b_str = b_str[b_str.index( '1' )..-1]

  b_str == b_str.reverse
end

sum = 0

(1..999999).each do |i|
  if palindromic_10?( i ) && palindromic_2?( i )
    sum += i
  end
end

puts sum
