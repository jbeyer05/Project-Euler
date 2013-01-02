require 'mathn'

N = 2000000

$primes = [2]
i = 3

def is_prime?( i )
  max_factor = ( i ** 0.51 ).to_i

  $primes.each do |j|
    if j > max_factor
      break
    end

    if i % j == 0
      return false
    end
  end

  true
end

while i < N
  if is_prime?( i )
    $primes << i
  end

  i += 2
end


sum = 0

$primes.each do |i|
  sum += i
end

puts sum
