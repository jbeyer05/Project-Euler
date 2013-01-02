
N     = 100
max_x = 0
max_D = nil


(2..N).each do |n|
  next if n == 61
  next if ( n ** 0.5 ).to_i == ( n ** 0.5 )

  denom = n ** 0.5

  x    = 0
  done = nil

  while ! done
    x += 1

    y_float = (( 1 - x * x ).to_f / ( -1 * n )) ** 0.5
#    y_float = (( -1 + x * x ) ** 0.5 ) / denom

    y_min = y_float.floor
    y_max = y_float.ceil

    puts "for D = #{n}, x = #{x}, checking from #{y_min} to #{y_max}" if n == 61
    (y_min..y_max).each do |y|
      next if y == 0

      if x * x - n * y * y == 1
        puts "HERE"
        done = true
        break
      end
    end
  end

  puts "for D = #{n}, x = #{x}"

  if x > max_x
    max_x = x
    max_D = n
  end
end

puts "FOR D = #{max_D}, x = #{max_x}"
