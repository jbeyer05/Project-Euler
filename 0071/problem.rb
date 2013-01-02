
N = 10**6

def gcd( a, b )
  c = 0

  while a > 0
    c = b % a
    b = a
    a = c
  end

  b
end

closest     = 0
closest_num = 0

(2..N).each do |denom|
  start  = 3 * denom / 7 - 2
  finish = 3 * denom / 7 + 1

#  puts "for #{denom}, going from #{start} to #{finish}"

  (start..finish).each do |num|
    fraction = num.to_f / denom

    if fraction < 3.0 / 7 && fraction > closest && gcd( num, denom ) == 1
      closest     = fraction
      closest_num = num
    end
  end
end

puts closest
puts closest_num
