require 'pp'

L = 200_000

$solutions = []
$cnt       = Array.new( L, 0 )

(0..L).each do |i|
  $solutions[i] = []
end

l = 0
cnt = 0

while l + 2 <= L
  l += 2
  cnt += 1
  print '.' if cnt % 100 == 0
  puts "SKIPPING l = #{l}, #{$solutions[l]}" if $cnt[l] > 1
  next if $cnt[l] > 1

  (1..( l / 2 )).each do |a|
    (1..a).each do |b|
      c = l - a - b

      if a*a + b*b == c*c #&& ! $solutions[l].index( [a,b,c] )
        puts "FOUND NEW TRIANGLE #{a},#{b},#{c}"

        l.step( L - 1, l ) do |l2|
          next if $cnt[l2] > 1

          mult = l2 / l
          $solutions[l2] << [mult*a,mult*b,mult*c]
          $cnt[l2] += 1
        end
      end
    end
  end
end

$solutions.each_index do |i|
  if $solutions[i].length == 1
#    puts i
#    pp $solutions[i]
  end
end

exit

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
