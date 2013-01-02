
N = 100000

def prime?( i )
  (2..(i**0.51).to_i).each do |j|
    if i % j == 0
      return false
    end
  end

  true
end

$primes = []

(2..N).each do |n|
  $primes << n if prime?( n )
end

$rad = []

(1..N).each do |n|
  product = 1
  _n = n

  $primes.each do |p|
    product *= p if n % p == 0

    while n % p == 0
      n /= p
    end

    break if n == 1
  end

  $rad << [_n,product]
#  puts "rad(#{_n}) = #{product}"
end

$rad.sort! do |x,y|
  if x[1] == y[1]
    x[0] <=> y[0]
  else
    x[1] <=> y[1]
  end
end

puts $rad[9999][0]
