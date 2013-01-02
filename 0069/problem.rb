
N = 10**6

$primes = []
max_phi = 0
max_n   = 0

def prime?( n )
  (2..(n**0.51).to_i).each do |i|
    if n % i == 0
      return
    end
  end

  $primes << n
end

(2..(N**0.51).to_i).each do |i|
  prime?( i )
end

(2..N).each do |n|
  factors = []
  _n = n

  $primes.each do |p|
    while n % p == 0
      n /= p
      factors << p
    end

    break if n == 1
  end

  factors.uniq!

  inv_phi = factors.inject( 1 ) do |product, factor|
    product * ( 1 - 1.0 / factor )
  end

  phi = 1 / inv_phi

  if phi > max_phi
    max_phi = phi
    max_n   = _n
  end

end

puts "max = #{max_phi} for n = #{max_n}"
