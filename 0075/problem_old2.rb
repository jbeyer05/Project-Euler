require 'pp'

L = 1_000

$squares = {}
cnt      = 0

(1..( L ** 0.51 ).to_i ).each do |i|
  $squares[i * i] = i
end

puts "DONE GENERATING SQUARES"

(1..L).each do |l|
  (1..l/2).each do |a|
    (( l/2 - a )..(( l - a ) / 2 )).each do |b|
      next if b == 0

      c = l - a - b
#      puts "TESTING #{l},#{a},#{b},#{c}"

      if a*a + b*b == c*c
#        pp [a,b,c]
        cnt += 1
      end
    end
  end
end

puts cnt
