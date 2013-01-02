require 'pp'

L = 10_000

cnt = 0
$grid      = []
$squares   = []
$squares_h = {}

(0..L/2).each do |i|
  $grid[i]        = Array.new( L/2, 0 )
  $squares[i]     = i*i
  $squares_h[i*i] = i
end

puts "DONE GENERATING SQUARES"

(1..L/2).each do |a|
#  max_b = ( L - a ) / 2
  max_b = L/2

  (a..max_b).each do |b|
    c2 = a*a + b*b

    if $squares_h[c2]
#      puts "FOUND NEW TRIANGLE #{a},#{b},#{$squares_h[c2]}"
      cnt += 1
      $grid[a][b] = $squares_h[c2]
    end
  end
end


puts cnt
