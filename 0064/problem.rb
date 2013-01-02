require 'pp'

N     = 50
count = 0

def period( n )
  digits = []
  o = n

  digits << ( n ** 0.5 ).to_i
  num   = 1
  denom = -1 * digits.last

  while digits.length < 15
    new_denom = n - denom * denom
    front     = [num,new_denom]   # front represents the numerical multiplicand that we can pull out of the fraction

    new_denom /= num
    num       = -1 * denom
    denom     = new_denom

    new_digit = 0

    while ( 23 ** 0.5 + num ) / denom.to_f < 0
      new_digit -= 1
      num += denom
    end

    while ( 23 ** 0.5 + num ) / denom.to_f > 1
      new_digit += 1
      num -= denom
    end

    digits << new_digit

    pp [num,denom,digits]

    ( num, denom ) = [ denom, num ]

    pp [num,denom]
  end

  1
end

(2..N).each do |n|
  next if ( n ** 0.5 ).to_i == ( n ** 0.5 )

  if period( n ) % 2 == 1
    count += 1
  end
end

puts count
