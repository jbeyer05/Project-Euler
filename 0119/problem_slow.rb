
count = 1
i = 10

def condition?( i )
  sum = 0

  i.to_s.split( // ).each do |d|
    sum += d.to_i
  end

  return false if sum == 1

  while i % sum == 0
    if sum == i
      return true
    end

    i /= sum
  end

  return false
end

while true
  if condition?( i )
    puts "#{count} -> #{i}"
    count += 1
  end

  i += 1
end
