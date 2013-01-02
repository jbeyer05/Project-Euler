require 'pp'

$primes = {}

def prime?( n )
  (2..(n**0.51).to_i).each do |i|
    if n % i == 0
      return false
    end
  end

  true
end

(1000..9999).each do |n|
  $primes[n] = true if prime?( n )
end

$primes.each_key do |n|
  (1..4500).each do |d|
    if $primes[ n + d ] && $primes[ n + d + d ]
      str_1 = n.to_s.split( // ).sort
      str_2 = ( n + d ).to_s.split( // ).sort
      str_3 = ( n + d + d ).to_s.split( // ).sort

      if str_1 == str_2 && str_2 == str_3
        pp [n, n + d, n + d + d ]
      end
    end
  end
end
