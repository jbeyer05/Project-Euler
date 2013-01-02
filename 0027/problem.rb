
$prime = {}

def prime?( i )
  return false if i < 0

  (2..( i ** 0.51 ).to_i ).each do |j|
    if i % j == 0
      return false
    end
  end

  true
end

max_n  = 0
best_a = 0
best_b = 0

(-999..999).each do |a|
  (-999..999).each do |b|
    n = 0

    while( prime?( n * n + a * n + b ))
      n += 1
    end

    if n > max_n
      puts "FOUND NEW BEST a,b,n : #{a},#{b},#{n}"
      best_a = a
      best_b = b
      max_n  = n
    end
  end
end

puts "#{best_a},#{best_b}"
