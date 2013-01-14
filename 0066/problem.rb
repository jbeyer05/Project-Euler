require 'pp'


def square?( n )
  ( n ** 0.5 ).to_i == ( n ** 0.5 )
end

MAX_X = MAX_Y = ARGV[0].to_i

D = 1000
max_x = 1
max_d = 0

n_min_x_found = 0

(1..D).each do |d|
  next if square?( d )

  (1..MAX_X).each do |x|
    next if ( x * x - 1 ) % d != 0
    next_d = nil

    (1..x).each do |y|
#    (1..(( x*x-1 ) / d )).each do |y|
      if x*x - d*y*y == 1
        next_d = true

        puts "min x for d,y #{d},#{y} : #{x}"
        n_min_x_found += 1

        if x > max_x
          puts "NEW MAX X : #{x}"
          max_x = x
          max_d = d
        end
      end

      break if next_d
    end

    break if next_d
  end
end

puts "MAX X : #{max_x}"
puts "MAX D : #{max_d}"

puts "found min x for #{ n_min_x_found } D's"
