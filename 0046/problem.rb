
N = 10000

$primes   = {}
$primes_a = []

def prime?( i )
  (2..( i ** 0.51 ).to_i).each do |j|
    if i % j == 0
      return false
    end
  end

  $primes[i] = true
  $primes_a << i
  true
end

(2..N).each do |i|
  prime?( i )
end


i = 3

while i < N
  _i = i

  (0..(i**0.51+1).to_i).each do |s|
    if $primes[i - 2 * s * s]
      i += 2
      next
    end
  end

  if i == _i
    puts i
    exit
  end
end
