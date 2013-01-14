require 'pp'

N = 10 ** ( ARGV[0].to_i ) + 1

$primes = Array.new( N.to_i, true )

def prime_sieve( n )
  puts "prime_sieve( #{n} )"

  (2..( n ** 0.51 ).to_i).each do |i|
    next if ! $primes[i]

    puts "SIEVING #{i}"

    (2..n/i).each do |j|
      $primes[i*j] = false
    end
  end
end

prime_sieve( N )

cnt = 0

(1..(N-1)).each do |i|
  i_good = true

  (1..(i**0.51).to_i).each do |divisor|
    if ( i % divisor == 0 )
      divisor2 = i / divisor
      if ! $primes[divisor + i / divisor] || ! $primes[divisor2 + i / divisor2]
        i_good = false

        break
      end
    end
  end

  if i_good
    cnt += i
  end
end

puts cnt

exit





divisors = Array.new( N + 1 )

(1..N).each do |i|
  divisors[i] = []
end

(1..N/2).each do |divisor|
  (1..N/divisor).each do |i|
#    puts "#{divisor*i} has divisors of #{divisor} and #{i}"
#    divisors[divisor*i] << divisor << i
  end
end

=begin
(1..N).each do |i|
  if divisors[i]
    divisors[i].uniq!
    divisors[i].sort!
  end
end
=end

#pp divisors

exit

count = 0

divisors.each_index do |i|
  next if i == divisors.length - 1
  if divisors[i] == divisors[i+1]
    count += 1
  end
end

puts count
