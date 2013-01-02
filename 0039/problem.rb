
N = 1000

max_count = 0
max_p     = 0

N.downto( N / 2 ).each do |p|
  next if N % 2 != 0
  count = 0

  (1..p/2+1).each do |a|
    a_prod = a*a

    (1..p-a-1).each do |b|
      c = p - a - b
      count += 1 if a_prod + b*b == c*c
      puts "#{a},#{b},#{c}" if p == 840 && a_prod + b*b == c*c
    end
  end

  if count > max_count
    max_count = count
    max_p     = p
  end
end

puts "#{max_count} solutions for p = #{max_p}"
