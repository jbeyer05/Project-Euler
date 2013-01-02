require 'pp'

G              = -9.81
V              = 20.0
H_V_INCREMENT  = 0.5
H_D_INCREMENT  = 0.5
h_velocity     = H_V_INCREMENT
max_height     = []

while h_velocity <= 20.0
  v_velocity = ( V * V - h_velocity * h_velocity ) ** 0.5
  height = 100.0

#  puts "now examing h_v = #{h_velocity}, v_v = #{v_velocity}"

  distance_step = 1
  while height > 0.0
    distance = H_D_INCREMENT * distance_step
    t = distance / h_velocity
    height = 100 + ( v_velocity * t ) + 0.5 * G * t * t

#    puts "height of #{height} at x = #{distance}"

    if ! max_height[distance_step] || height > max_height[distance_step]
      if height > 0
        max_height[distance_step] = height
        if h_velocity > ( V * V / 2.0 ) ** 0.5
          puts "new max height of #{height} when h_v = #{h_velocity} and distance = #{distance}"
        end
      end
    end

    distance_step += 1
  end

  h_velocity += H_V_INCREMENT
end

cross_section_area = 0.0
distance_step = 1

while max_height[distance_step]
  cross_section_area += H_D_INCREMENT * max_height[distance_step]
  distance_step += 1
end

puts distance_step * H_D_INCREMENT
puts cross_section_area
