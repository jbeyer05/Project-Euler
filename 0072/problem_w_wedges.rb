require 'pp'

N      = 10**3
WEDGES = 100

fractions_to_skip = {}

def gcd( a, b )
  c = 0
#  pp [a,b]

  while a > 0
    c = b % a
    b = a
    a = c

#    pp [a,b,c]
  end

#  puts
  b
end


count = 0
wedge_walker = 0

# when wedge_walker == 1, num range is 0 -> N / WEDGES
# when wedge_walker == 2, num range is N / WEDGES -> 2 * N / WEDGES

while wedge_walker < WEDGES
  fractions_to_skip = {}

  (2..N).each do |denom|
#    puts "TESTING #{wedge_walker * N * denom / WEDGES / N} -> #{( wedge_walker + 1 ) * N * denom / WEDGES / N} / #{denom}" if denom % 10 == 0

    (wedge_walker * N / WEDGES..( wedge_walker + 1 ) * N / WEDGES).each do |num|
      next if fractions_to_skip[[num,denom]]

      count += 1 if gcd( num, denom ) == 1

      _num   = num
      _denom = denom
      while _denom < N
        fractions_to_skip[[_num,_denom]] == true
        _num   *= 2
        _denom *= 2
      end
    end
  end

  wedge_walker += 1
end

puts count
