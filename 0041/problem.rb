
N = 9

def prime?( i )
  (2..(i**0.51).to_i).each do |j|
    return false if i % j == 0
  end

  true
end

largest = 1

N.downto( 1 ) do |length|
  (1..length).to_a.permutation do |num|
    n = num.join( '' ).to_i

    if prime?( n )
      if n > largest
        largest = n
      end
    end
  end
end

puts largest
