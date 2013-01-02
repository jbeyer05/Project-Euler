
def prime?( n )
  (2..(n**0.51).to_i).each do |i|
    if n % i == 0
      return false
    end
  end

  true
end

count       = 0
width       = 1
last_corner = 1

while true
  count += 1 if prime?( last_corner + 1 * ( width + 1 ))
  count += 1 if prime?( last_corner + 2 * ( width + 1 ))
  count += 1 if prime?( last_corner + 3 * ( width + 1 ))
  count += 1 if prime?( last_corner + 4 * ( width + 1 ))

  corners = 2 * ( width + 2 ) - 1
#  puts "#{count.to_f / corners} numbers are prime"

  if count.to_f / corners < 0.1
    puts ( width + 2 )
    exit
  end

  last_corner += 4 * ( width + 1 )
  width += 2
end
