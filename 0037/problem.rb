require 'pp'

N = 11

n = 9

truncatable_primes = []

def prime?( i )
  (2..( i ** 0.51 ).to_i ).each do |j|
    if i % j == 0
      return false
    end
  end

  true
end

while true
  n += 2

  next if n.to_s[0,1] == '1' || n.to_s[-1,1] == '1'
  next if n.to_s[1..-1].index( '2' )

  if prime?( n )
    good  = true
    n_str = n.to_s

    (1..(n_str.length - 1)).each do |i|
      num1 = n_str[0,i].to_i
      num2 = n_str[i,n_str.length-i].to_i

      if ! ( prime?( num1 ) && prime?( num2 ))
        good = false
        break
      end
    end

    if good
      truncatable_primes << n

      if truncatable_primes.size >= N
        pp truncatable_primes
        exit
      end
    end
  end
end
