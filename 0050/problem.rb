require 'pp'

N = 999999

$primes   = {}
$primes_a = []

def prime?( n )
  (2..(n**0.51).to_i).each do |i|
    if n % i == 0
      return false
    end
  end

  $primes[n] = true
  $primes_a << n
  true
end

class Array
  def sum
    sum = 0

    self.each do |i|
      sum += i
    end

    sum
  end
end

(2..N).each do |n|
  prime?( n )
end

walker = 1
while $primes_a[0,walker].sum < N
  walker += 1
end

walker.downto( 1 ).each do |len|
  (0..$primes_a.length-len+1).each do |start|
    sum = $primes_a[start,len].sum
    break if sum > N

    if $primes[sum]
      puts "PRIME is #{$primes_a[start,len].sum}, length of #{len}, starting at #{start}"
      exit
    end
  end
end
