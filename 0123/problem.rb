
N = 10**10

$primes = Array.new( 10**7, true )

def prime_sieve( n )
  (2..( n ** 0.51 ).to_i).each do |i|
    next if ! $primes[i]

#    puts "SIEVING #{i}"

    (2..n/i).each do |j|
      $primes[i*j] = false
    end
  end
end

prime_sieve( 10**7 )

$prime = [0]
$primes.each_index do |i|
  next if i == 0 || i == 1

  if $primes[i]
    $prime << i
  end
end

require 'pp'
pp [$prime.length,$prime.last]

n = 7035

while true
  mod = (( $prime[n] - 1 ) ** n + ( $prime[n] + 1 ) ** n ) % ( $prime[n] ** 2 )
  puts "MOD = #{mod} for n = #{n}"
  if mod > N
    break
  end

  n += 1000
end

n -= 1000

while true
  mod = (( $prime[n] - 1 ) ** n + ( $prime[n] + 1 ) ** n ) % ( $prime[n] ** 2 )
  puts "MOD = #{mod} for n = #{n}"
  if mod > N
    break
  end

  n += 100
end

n -= 100

while true
  mod = (( $prime[n] - 1 ) ** n + ( $prime[n] + 1 ) ** n ) % ( $prime[n] ** 2 )
  puts "MOD = #{mod} for n = #{n}"
  if mod > N
    puts n
    puts mod
    exit
  end

  n += 2
end
