require 'pp'

n = ARGV[0].to_i

(1..n).each do |i|
  puts "#{i}" if n % i == 0
end


N = 1_000;

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

(2..N).each do |n|
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
          $factors[_n] << n / p if p * p != n

#          while n % p == 0
            n /= p
#          end
        end
      end

      break if n == 1
    end
  end
end

(1..N).each do |n|
  if $factors[n]
    puts "#{n}: #{$factors[n].join( ',' )}"
  end
end
