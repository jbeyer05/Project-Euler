
def sum_digits( i )
  sum = 0

  i.to_s.each_char do |c|
    sum += c.to_i
  end

  sum
end

max_n = 0

(1..99).each do |a|
  (1..99).each do |b|
    n = sum_digits( a ** b )
    max_n = n if n > max_n
  end
end

puts max_n
