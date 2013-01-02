
N = 50_000_000

$squares = [1]
$squares_hash = {}

def square?( n )
  while $squares.last < n
    $squares << ( $squares.length + 1 ) ** 2
    $squares_hash[$squares.last] = true
  end

  $squares_hash[n]
end

def r_triangle?( a, b )
  square?( a*a + b*b )
end

(1..N).each do |h|
  next if h % 2 == 0

  if r_triangle?(( h + 1 ) / 2, h )
    puts "b = #{ ( h + 1 ) / 2 }, h = #{h}"
  end

  if r_triangle?(( h - 1 ) / 2, h )
    puts "b = #{ ( h - 1 ) / 2 }, h = #{h}"
  end
end
