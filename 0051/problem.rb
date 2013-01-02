require 'pp'

N = 10**6

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

$prime = []
$prime_hash = {}

$primes.each_index do |i|
  next if i == 0 || i == 1

  if $primes[i]
    $prime << i.to_s
    $prime_hash[$prime.last] = true
  end
end

$masks = {}
(1..8).each do |length|
  $masks[length] = []

  (1..(2**length-2)).each do |i|
    $masks[length][i-1] = []

    _i = i
    bit = 1

    while i >= 1
      if i % 2 == 1
        $masks[length][_i-1] << bit
      end

      i   /= 2
      bit += 1
    end
  end
end


max_count = 0

$prime.each do |p|
#  puts "TESTING prime #{p}"
  masks = $masks[p.length]
  masks.each do |mask|
    ch = p[mask.first-1]
    valid = true
    mask.each do |swap_point|
      valid = false if ch != p[swap_point-1]
    end

    # if digits in mask aren't all the same, we shouldn't even consider this number
    next if ! valid


#    puts " WITH MASK #{mask}"
    count = 0

    ('0'..'9').each do |new_digit|
#      puts "  WITH NEW DIGIT #{new_digit}"
      _p = p.clone

      mask.each do |swap_point|
        _p[swap_point-1] = new_digit
      end

      count += 1 if $prime_hash[_p]
#      puts "   FOUND PARALLEL PRIME #{_p}" if $prime_hash[_p]
    end

    if count > max_count
      max_count = count
      puts "#{p} has #{count} other primes with mask : "
      pp mask
      exit if max_count >= 8
    end
  end
end

