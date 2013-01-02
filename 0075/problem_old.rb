require 'pp'

L = 10_000

$squares = {}
cnt      = 0

(1..( L ** 0.51 ).to_i ).each do |i|
  $squares[i * i] = i
end

puts "DONE GENERATING SQUARES"

(1..L).each do |l|
  (1..l/2).each do |a|
    num   = 2 * a * l - l * l
    denom = -2 * l + 2 * a

    if num % denom == 0
      b = num / denom

      if b > 0
#        pp [a,b,l-a-b]
        cnt += 1
      end
    end
  end
end

puts cnt
