
sum = 0

%w( 0 1 2 3 4 5 6 7 8 9 ).permutation.to_a.each do |num|
  next if num[0] == '0'

  if num[7,3].join.to_i % 17 == 0 &&
     num[6,3].join.to_i % 13 == 0 &&
     num[5,3].join.to_i % 11 == 0 &&
     num[4,3].join.to_i % 7  == 0 &&
     num[3,3].join.to_i % 5  == 0 &&
     num[2,3].join.to_i % 3  == 0 &&
     num[1,3].join.to_i % 2  == 0
    sum += num.join.to_i
  end
end

puts sum
