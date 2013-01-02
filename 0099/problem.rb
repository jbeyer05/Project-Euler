require 'pp'

line_no  = 1
max      = 0
max_l_no = 0

File.readlines( '0099/base_exp.txt' ).each do |line|
  ( a, b ) = line.split( ',' )
  ( a, b ) = [ a.to_i, b.to_i ]

  if Math.log( a ) * b > max
    max = Math.log( a ) * b
    max_l_no = line_no
  end

  line_no += 1
end

puts max_l_no
