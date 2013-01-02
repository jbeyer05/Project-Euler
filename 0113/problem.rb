
N      = 100
DIGITS = 10


def fact( i )
  if i == 1
    1
  else
    fact( i - 1 ) * i
  end
end

def choose( i, j )
  fact( i ) / fact( j ) / fact( i - j )
end


forward = choose( N + DIGITS - 1, DIGITS - 1 ) - 1
reverse = choose( N + DIGITS, DIGITS ) - N - 1

puts forward
puts reverse
puts forward + reverse - ( 9 * N )
