
N = 2 * 10 ** 6

$primes = Array.new( N, true )

def prime_sieve( n )
  (2..( n ** 0.51 ).to_i).each do |i|
    next if ! $primes[i]

#    puts "SIEVING #{i}"

    (2..n/i).each do |j|
      $primes[i*j] = false
    end
  end
end

prime_sieve( N )

sum = 0

$primes.each_index do |i|
  next if i == 0 || i == 1

  if $primes[i]
    sum += i
  end
end

puts sum
