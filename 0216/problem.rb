# fairly close to getting this problem
# perhaps need to not divide each potential prime by every prime number
# some potential divisors can be disqualified by examining last X digits of 2*N^2-1
=begin
3X = 2N^2 - 1

3X + 1 = 2 * N^2

3,6,9,2,5,8,1,4,7,0
4,7,0,3,6,9,2,5,8,1
2,X,05,X,3,X,1,X,4,X

5X = 2N^2 - 1

5X + 1 = 2 * N^2
1,6
X,3

23X + 1 = 2 * N^2


11X + 1 = 2 * N^2
12,23,34,45,56,67,78,89,100
06,XX,17,XX,28,XX,39,XX,10


17X + 1 = 2 * N^2
18,35,52,69,86,103,120,137,154,171,188
09,XX,26,XX,43,XXX,060,XXX,077,XXX,099
=end



N = ( 5*10**7 ).to_i

$primes = Array.new( (( 2 * N * N ) ** 0.5 ).to_i, true )

def prime_sieve( n )
  (2..( n ** 0.51 ).to_i).each do |i|
    next if ! $primes[i]

    puts "SIEVING #{i}"

    (2..n/i).each do |j|
      $primes[i*j] = false
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


count = 0
prime_sieve((( 2 * N * N ) ** 0.5 ).to_i )

$prime_nums = []
$primes.each_index do |i|
  next if i == 0 || i == 1

  if $primes[i]
    $prime_nums << i
  end
end

require 'pp'
pp [$prime_nums.length,$prime_nums.last]

puts "EXITING EARLY"
exit

$prime_nums.delete( 5 )

(2..N).each do |n|
#  count += 1 if $primes[ ( 2 * n * n - 1 ) ]
#  print '.' if n % 100 == 0
#  puts if n % 10000 == 0
  count += 1 if prime?( 2 * n * n - 1 )
end

puts count
