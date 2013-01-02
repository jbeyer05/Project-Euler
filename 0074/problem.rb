require 'pp'

N = 10**6

$factorial = []
$m = {}

count = 0

"1234567890".each_byte do |b|
  digit   = b - '0'.getbyte( 0 )
  product = 1
  (1..digit).each do |d|
    product *= d
  end

  $factorial[b] = product
end


def sum_factorial( n )
  if $m[n]
    $m[n]
  else
    sum = 0

    n.to_s.each_byte do |b|
      sum += $factorial[b]
    end

    $m[n] = sum
  end
end

count = 0

(1..N).each do |n|
#  puts "#{n}" if n % 100 == 0

  _n    = n
  chain = {}

  while ! chain[n]
    chain[n] = true

    n = sum_factorial( n )
  end

  puts "#{_n} : #{chain.keys.length - 1 }" if chain.keys.length == 60
  count += 1 if chain.keys.length == 60
end

puts count
