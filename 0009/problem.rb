
(1..998).each do |a|
  (1..(1000-a-1)).each do |b|
    c = 1000 - a - b

    if a*a + b*b == c*c
      puts a*b*c
      exit
    end
  end
end
