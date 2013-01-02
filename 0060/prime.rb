require 'pp'

$primes     = []
$prime_hash = {}

def prime_sieve( n )
  $primes_a = Array.new( n, true )

  (2..(n**0.501).to_i).each do |i|
    next if ! $primes_a[i]

#    puts "SIEVING #{i}"

    (2..n/i).each do |j|
      $primes_a[i*j] = false
    end
  end
end

prime_sieve( ARGV[0].to_i )

$primes_a.each_index do |i|
  next if i == 0 || i == 1

  if $primes_a[i]
    $primes << i
    $prime_hash[i] = true
  end
end

pp [$primes.length,$primes.last]
