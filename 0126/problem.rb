
c      = Array.new( 100, 0 )
grides = {}

def cubes_to_cover( layer, l, w, h )
  grid = grids[l.to_s + ',' + w.to_s + ',' + h.to_s]
  grid
  grids[l.to_s + ',' + w.to_s + ',' + h.to_s] = grid
end

puts cubes_to_cover( 1, 3, 2, 1 )
puts cubes_to_cover( 2, 3, 2, 1 )
exit


(1..20).each do |i|
  (i..20).each do |j|
    (j..20).each do |k|
      (1..100).each do |layer|
        ret = cubes_to_cover( layer, i, j, k )
        if ! c[ret]
          c[ret] = 1
        else
          c[ret] += 1
        end
      end
    end
  end
end

require 'pp'
pp c

(1..160).each do |i|
  puts "#{i} -> #{c[i]}"
end
