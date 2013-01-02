
def r( a, n )
  ( ( a - 1 ) ** n + ( a + 1 ) ** n  ) % ( a * a )
end

def cycle?( array )
  array.length % 2 == 0 && ( array[0,array.length/2] == array[-1 * array.length/2,array.length/2] )
end

def r_max( a )
  remainders = []
  n = 1
  first_addend  = a - 1
  second_addend = a + 1
  a_squared     = a * a
  remainders << ( first_addend + second_addend ) % a_squared

  while ! cycle?( remainders )
    first_addend  *= a - 1
    second_addend *= a + 1

    remainders << ( first_addend + second_addend ) % a_squared
    n += 1
  end

#  pp remainders
  remainders[0,remainders.length/2].max
end

count = 0

(3..1000).each do |a|
  rm     = r_max( a )
  count += rm
#  puts "a = #{a}, r_max = #{rm}"
end

puts count
