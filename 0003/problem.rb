require 'pp'

N = 600851475143

def prime?( i )
  (2..(i**0.51).to_i).each do |j|
    if i % j == 0
      return false
    end
  end

  true
end

(2..N).each do |i|
  if N % i == 0
    if prime?( N / i )
      puts N / i
      exit
    end
  end
end
