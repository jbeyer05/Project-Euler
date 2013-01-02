require 'pp'

$primes   = [2]
$c_primes = { 2 => true }

def prime?( i )
  (2..( i ** 0.51 ).to_i ).each do |j|
    if i % j == 0
      return false
    end
  end

  true
end

i = 3
while i <= 999999
  if prime?( i )
    $primes << i
    $c_primes[ i ] = true
  end

  i += 2
end

$primes.each do |prime|
  ps = prime.to_s

  (1..ps.length).each do |i|
    if ! $c_primes[( ps + ps )[i,ps.length].to_i]
      $c_primes.delete( prime )
      break
    end
  end
end

pp $c_primes.keys.sort
puts $c_primes.keys.length
