
def pandigital?( str )
  str.split( // ).sort.join == '123456789'
end

largest_sum = '0'

(2..4000).each do |n|
  i   = 1
  sum = ''

  while sum.length < 10
    sum = ''
    (1..n).each do |o|
      sum += ( o * i ).to_s
    end

    if sum > largest_sum && sum.length == 9 && pandigital?( sum )
      largest_sum = sum
    end

    i += 1
  end
end

puts largest_sum
