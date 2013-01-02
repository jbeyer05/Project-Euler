
N = 500

triangle_number     = 1
ith_triangle_number = 1

def factors( i )
  factors = []

  (1..(i**0.51).to_i).each do |j|
    if i % j == 0
      factors << j
      factors << i / j
    end
  end

  factors
end

while factors( triangle_number ).length <= N
  ith_triangle_number += 1
  triangle_number += ith_triangle_number
end

puts triangle_number
