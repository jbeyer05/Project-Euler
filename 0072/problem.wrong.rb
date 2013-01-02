require 'pp'

N = 10**2
$primes    = []
factors    = [nil,[1]]
fractions  = []

def prime?( n )
  (2..(n**0.51).to_i).each do |i|
    if n % i == 0
      return false
    end
  end

  $primes << n
  true
end

(2..(N**0.51).to_i).each do |n|
  prime?( n )
end

puts "FOUND primes up to #{N}"


(2..N).each do |n|
  _n = n
  factors[_n] = [n]

  $primes.each do |p|
    break if n == 1 || p * p > _n
#    break if p * p > n || n == 1

    if n % p == 0
      factors[_n] << p

      while n % p == 0
        n /= p
      end
    end
  end
end

=begin
factors.each_index do |i|
  puts i
  pp factors[i]
end
puts "FACTORED all nums up to #{N}"
puts "****"
puts "****"
puts "****"
pp factors[2]
pp factors[4]
pp factors[4] & factors[2]
puts "****"
puts "****"
puts "****"
=end

twos = [3**1,3**2,3**3,3**4,3**5,3**6,3**7,3**8,3**9]

count   = 0
new_denoms = []

(1..N).each do |num|
  new_denoms = []

  (num+1..N).each do |denom|
    count   += 1 if factors[num] & factors[denom] == []
    new_denoms << denom if factors[num] & factors[denom] == []

#    fractions << num.to_f / denom
  end

  puts "new for num #{num} #{new_denoms.length}" if num % 2 == 0
end

puts count
#puts fractions.uniq.length


#pp fractions
