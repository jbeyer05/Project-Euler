require 'pp'

N = 10**6
$primes    = []
factors    = [nil,[1]]
fractions  = []

def prime?( n )
  (2..(n**0.51).to_i).each do |i|
    if n % i == 0
      return false
    end
  end

  $primes << n
  true
end

(2..(N).to_i).each do |n|
  prime?( n )
end

puts "HERE"


(2..N).each do |n|
  _n = n
  factors[_n] = [_n]

  $primes.each do |p|
    break if p * p > n || n == 1

    if n % p == 0
      factors[_n] << p

      while n % p == 0
        n /= p
      end
    end
  end
end

puts "STARTING"

exit

(1..N).each do |num|
  (num+1..N).each do |denom|
    next if factors[num] & factors[denom] != []

    fractions << num.to_f / denom
  end
end

puts fractions.uniq.length


#pp fractions
