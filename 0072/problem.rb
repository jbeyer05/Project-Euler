require 'pp'

N = 10**6

$primes  = []
$prime_hash = {}
$factors = []

def prime?( n )
  (2..(n**0.51).to_i).each do |i|
    if n % i == 0
      return false
    end
  end

  $primes << n
  $prime_hash[n] = true
end

(2..(N).to_i).each do |i|
  prime?( i )
end

count = 0
finished_denoms = {}

(2..N).each do |n|
  next if finished_denoms[n]

  _n = n
  $factors[_n] = []

  if $prime_hash[_n]
    $factors[_n] = [_n]
  else
    $primes.each do |p|
      if $factors[n] && $factors[n] != []
        $factors[_n] += $factors[n]
        break
      else
        if n % p == 0
          $factors[_n] << p

          while n % p == 0
            n /= p
          end
        end
      end

      break if n == 1
    end
  end

  phi = $factors[_n].inject( _n ) do |product, factor|
    product * ( factor - 1 ) / factor
  end

  n = _n

  while n <= N
    finished_denoms[n] = true
    count += phi * n / _n

    n *= _n
  end
end

puts count
