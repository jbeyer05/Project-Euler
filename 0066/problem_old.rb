
N     = 100
max_x = 0
max_D = nil

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


(2..N).each do |n|
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
