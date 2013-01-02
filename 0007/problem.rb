
N = ARGV[0].to_i

primes = []
i = 2

def is_prime?( i )
  (2..(i**0.51).to_i).each do |j|
    if i % j == 0
      return false
    end
  end

  true
end

while primes.length < N
  if is_prime?( i )
    primes << i
  end

  i += 1
end

puts primes.last
