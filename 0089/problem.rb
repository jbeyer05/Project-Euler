require 'pp'

M = { 'I' => 1, 'V' => 5, 'X' => 10, 'L' => 50, 'C' => 100, 'D' => 500, 'M' => 1000 }
#N = { 1000 => 'M', 500 => 'D', 100 => 'C', 50 => 'L', 10 => 'X', 5 => 'V', 1 => 'I' }
#C = { 900 => 'CM', 400 => 'CD', 'XC' => 90, 'XL' => 40, 'IX' => 9, 'IV' => 4 }
N = { 1000 => 'M', 900 => 'CM', 500 => 'D', 400 => 'CD', 100 => 'C', 90 => 'XC', 50 => 'L', 40 => 'XL', 10 => 'X', 9 => 'IX', 5 => 'V', 4 => 'IV', 1 => 'I' }

numerals = File.readlines( '0089/roman.txt' )
sum = 0

numerals.each do |numeral|
  numeral.chomp!
  _n = numeral
  arabic = 0

  while numeral.length > 1
    if M[numeral[0,1]] < M[numeral[1,1]]
      arabic += M[numeral[1,1]] - M[numeral[0,1]]
      numeral = numeral[2..-1]
    else
      arabic += M[numeral[0,1]]
      numeral = numeral[1..-1]
    end
  end

  arabic += M[numeral[0,1]] if numeral.length > 0

  print "#{_n} => #{arabic}"
  roman = ''

  N.keys.sort.reverse.each do |k|
    while arabic >= k
      roman  += N[k]
      arabic -= k
    end
  end

  puts " => #{roman} => #{ _n.length - roman.length }"
  sum += _n.length - roman.length
end

puts sum
