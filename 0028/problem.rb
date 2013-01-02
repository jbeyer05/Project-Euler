
sum = 1

width       = 1
last_corner = 1

while width < 1001
  sum += ( 4 * last_corner ) + 10 * ( width + 1 )
  last_corner += 4 * ( width + 1 )
  width += 2
end

puts sum
