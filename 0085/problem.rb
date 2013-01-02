
N = 2 * 10**6

def n_rectangles( x, y, i, j )
  ( x - i + 1 ) * ( y - j + 1 )
end

def n_rectangles_all_sizes( x, y )
  count = 0

  (1..x).each do |i|
    temp = x - i + 1

    (1..y).each do |j|
      count += temp * ( y - j + 1 )
    end
  end

  count
end

x = 1
min_distance = 1000
area = 0

while n_rectangles_all_sizes( x, 1 )
  foo = n_rectangles_all_sizes( x, 1 )

  if ( N - foo ).abs < min_distance
    min_distance = ( N - foo ).abs
    area = x
  end

  break if foo > N

  x += 1
end


y     = 2
max_y = x

while y < max_y
  x = 1

  while n_rectangles_all_sizes( x, y )
    foo = n_rectangles_all_sizes( x, y )

    if ( N - foo ).abs < min_distance
      min_distance = ( N - foo ).abs
      area = x * y
    end

    if foo > N
      puts "for y = #{y}, x got up to #{x}"
      break
    end

    x += 1
  end

  y += 1
end

puts area
