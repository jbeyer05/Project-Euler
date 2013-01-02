
N = 28123

$abundant = {}

def abundant?( n )
  sum = 0

  (1..(n / 2 )).each do |i|
    if n % i == 0
      sum += i
    end
  end

  sum > n
end

(1..N).each do |n|
  if abundant?( n )
    $abundant[n] = true
  end
end

sum = 0

(1..N).each do |n|
  no_pairs = true

  $abundant.each_key do |a|
    if $abundant[n-a]
      no_pairs = false
      break
    end
  end

  sum += n if no_pairs
end

puts sum
