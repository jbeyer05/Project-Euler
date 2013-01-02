
N = 51

def prime?( i )
  (2..(i**0.51).to_i).each do |j|
    if i % j == 0
      return false
    end
  end

  true
end

pascals_numbers = []
top_row = [ 1 ]

(2..N).each do |row|
  top_row << 0
  new_top_row = []

  top_row.each_index do |i|
    new_top_row << top_row[i] + top_row[i-1]
  end

  top_row = new_top_row

  top_row.each do |num|
    pascals_numbers << num
  end
end

pascals_numbers.uniq!.sort!

require 'pp'
pp pascals_numbers

sum = 0

pascals_numbers.each do |n|
  good = true

  (2..(n**0.51).to_i).each do |i|
    if n % ( i * i ) == 0
      good = nil if prime?( i )
      break
    end
  end

  sum += n if good
end

puts sum
