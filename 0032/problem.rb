
def factor_pairs( i )
  ret = []

  (2..(i**0.51).to_i).each do |j|
    if i % j == 0
      ret << [ i / j, j ]
    end
  end

  ret
end

def pandigital?( str )
  str.split( // ).sort == [ '1', '2', '3', '4', '5', '6', '7', '8', '9' ]
end

(1..500000).each do |i|
  factor_pairs( i ).each do |pair|
    if pandigital?( pair[0].to_s + pair[1].to_s + i.to_s )
      puts "#{pair[0]} X #{pair[1]} = #{i}"
    end
  end
end
