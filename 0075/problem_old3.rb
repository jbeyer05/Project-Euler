require 'pp'

L = 20_000

$squares   = {}
$squares_a = []
cnt        = 0

(1..( L / 2 )).each do |i|
  $squares[i * i] = i
  $squares_a[i]   = i * i
end

puts "DONE GENERATING SQUARES"

(1..( L/2 )).each do |a|
  (1..a).each do |b|
    sum_squares = $squares_a[a] + $squares_a[b]
    puts "CHECKING TO SEE IF #{sum_squares} is a square"

    c = $squares[$squares_a[a] + $squares_a[b]]

    if c
#      puts "TESTING #{a},#{b},#{c}"
#      pp [a,b,c]
      cnt += 1
    end
  end
end

puts cnt
