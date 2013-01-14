require 'pp'

D           = 100
min_X       = {}
min_X_count = 0

def square?( n )
  ( n ** 0.5 ).to_i == ( n ** 0.5 )
end

$squares = [1]
$squares_hash = {}

def square2?( n )
  while $squares.last < n
    $squares << ( $squares.length + 1 ) ** 2
    $squares_hash[$squares.last] = true
  end

  $squares_hash[n]
end


# d can't be square
(1..D).each do |d|
  if square?( d )
    min_X[d] = nil
    min_X_count += 1
  end
end

x = 1

while min_X_count < D - 5
  puts "X = #{x}\n\n"
  x2 = x * x

  (2..D).each do |d|
#    puts "already have min_X for #{d}" if min_X[d]
    next if min_X[d]

    puts "d can't be greater than x2, #{d} > #{x2}" if d > x2
    break if d > x2

    puts "#{ x2 - 1 } not divisible by #{d}" if ( x2 - 1 ) % d != 0
    next if ( x2 - 1 ) % d != 0

    if square?(( x2 - 1 ) / d )
      min_X[d] = x
      min_X_count += 1
      puts "for d = #{d}, min x is #{x}"
      break
    end
  end

  x += 1
end

exit


(2..D).each do |n|
  next if n == 61
  next if ( n ** 0.5 ).to_i == ( n ** 0.5 )

  denom = n ** 0.5

  y    = 0
  done = nil

  while ! done
    y += 1

    if square?( 1 + n * y * y )
      done = true
    end
  end

  x = (( 1 + n * y * y ) ** 0.5 ).to_i

  puts "for D = #{n}, x = #{x}"

  if x > max_x
    max_x = x
    max_D = n
  end
end

puts "FOR D = #{max_D}, x = #{max_x}"
