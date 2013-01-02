require 'pp'

N = 200000

$primes = []

def prime?( i )
  (2..( i ** 0.51 ).to_i).each do |j|
    if i % j == 0
      return false
    end
  end

  $primes << i
  true
end

(2..N).each do |i|
  prime?( i )
end


last_factor = 2
num_factors = [0,0]

(2..N).each do |i|
  _i = i
  factors = {}

  while i > 1
    $primes.each do |j|
      if i % j == 0
        i /= j
        factors[j] = true
        break
      end
    end
  end

  num_factors << factors.keys.length

  if num_factors[-1] == 4 &&
     num_factors[-2] == 4 &&
     num_factors[-3] == 4 &&
     num_factors[-4] == 4
    puts "#{_i - 3} -> #{_i}"
    exit
  end
end
