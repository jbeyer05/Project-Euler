
N = 50_000_000

$primes   = []

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

prime_sieve(( N ** 0.51 ).to_i )

$primes_a.each_index do |i|
  next if i == 0 || i == 1

  if $primes_a[i]
    $primes << i
  end
end

nums  = []

$primes.each do |p4|
  t1 = p4 ** 4
  next if t1 > N

  $primes.each do |p3|
    t2 = t1 + p3 ** 3
    next if t2 > N

    $primes.each do |p2|
      sum = t2 + p2 ** 2

      if sum < N
        nums << sum
      end
    end
  end
end

puts nums.uniq.length

