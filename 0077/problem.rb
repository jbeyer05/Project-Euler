require 'pp'

$primes     = []
$prime_hash = {}

def prime_sieve( n )
  $primes_a = Array.new( n, true )

  (2..n).each do |i|
    next if ! $primes_a[i]

#    puts "SIEVING #{i}"

    (2..n/i).each do |j|
      $primes_a[i*j] = false
    end
  end
end

prime_sieve( 1_000 )

$primes_a.each_index do |i|
  next if i == 0 || i == 1

  if $primes_a[i]
    $primes << i
    $prime_hash[i] = true
  end
end



$hash  = {}

def recurse( addends, add_sum, n )
  if add_sum == n
    1
  elsif $hash[[n - add_sum,addends.last]]
    $hash[[n - add_sum,addends.last]]
  else
    start = 0
    if addends == []
      start = n - add_sum
    else
      start = [n-add_sum,addends.last].min
    end

    sum = 0
    start.downto( 1 ) do |i|
      next if ! $prime_hash[i]
      sum += recurse( addends + [i], add_sum + i, n )
    end

    $hash[[n - add_sum,addends.last]] = sum
    sum
  end
end

n    = 1
sums = 0

while sums < 5_000
  sums = recurse( [n-1], 0, n )
  puts "n : #{n}, sums : #{sums}"

  n += 1
end

