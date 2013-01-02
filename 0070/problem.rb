require 'pp'

N = 3*10**6

$primes   = []
$primes_a = Array.new( N, true )
$factors  = []

def prime_sieve( n )
  (2..n).each do |i|
    next if ! $primes_a[i]

#    puts "SIEVING #{i}"

    (2..n/i).each do |j|
      $primes_a[i*j] = false
    end
  end
end

def prime?( n )
  sqrt_n = ( n ** 0.51 ).to_i

  $prime_nums.each do |i|
    break if i > sqrt_n

    if n % i == 0
      return false
    end
  end

  true
end


prime_sieve( N )

$primes_a.each_index do |i|
  next if i == 0 || i == 1

  if $primes_a[i]
    $primes << i
  end
end

puts "DONE WITH PRIMES"

min_ratio = 10.0
min_n     = nil
finished_denoms = {}

(2..N).each do |n|
  _n = n
  $factors[_n] = []

  if $primes_a[_n]
    $factors[_n] = [_n]
  else
    $primes.each do |p|
      if $factors[n] != []
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

  ratio = _n.to_f / phi
  n = _n

  if ratio < min_ratio
    if phi.to_s.split( // ).sort == n.to_s.split( // ).sort
      puts "phi is #{phi}, n is #{_n}, ratio is #{ratio}"
      min_ratio = ratio
      min_n = n
    end
  end
end

puts "min_ratio = #{min_ratio} for n = #{min_n}"
