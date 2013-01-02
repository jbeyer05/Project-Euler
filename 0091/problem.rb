#!/usr/bin/env ruby1.9

require 'pp'

N = 50
count = 0
valid = {}

(0..N).each do |x1|
  (0..N).each do |y1|
    (0..N).each do |x2|
      (0..N).each do |y2|
        next if ( x1 == 0 && y1 == 0 ) || ( x2 == 0 && y2 == 0 ) || ( x1 == x2 && y1 == y2 ) || valid[[x2,y2,x1,y1]]

        l2_1 = x1*x1 + y1*y1
        l2_2 = x2*x2 + y2*y2
        l2_3 = (x2-x1)*(x2-x1) + (y2-y1)*(y2-y1)

        pp [l2_1,l2_2,l2_3] if [x1,y1,x2,y2] == [2,2,2,0]

        if l2_1 + l2_2 == l2_3 || l2_1 + l2_3 == l2_2 || l2_2 + l2_3 == l2_1
          valid[[x1,y1,x2,y2]] = 1
#          puts "RA at #{[x1,y1,x2,y2].join( ',' )}"
          count += 1
        end
      end
    end
  end
end

puts
puts count
