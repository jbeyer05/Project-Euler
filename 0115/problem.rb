
M = 50

$h = {}

def recurse( first_time, blocks_remaining, stack = [] )
  return 1 if blocks_remaining < M
  return $h[blocks_remaining] if $h[blocks_remaining]

  sum = 1
  start = first_time ? 0 : 1

  (M..blocks_remaining).each do |length|
    (start..blocks_remaining-length).each do |gap|
      sum += recurse( false, blocks_remaining - gap - length, stack + [gap,length] )
    end
  end

  $h[blocks_remaining] = sum if ! first_time
  sum
end


i = M
temp = recurse( true, i )

while temp < 1_000_000
  puts "#{i} -> #{temp}"
  i += 1
  temp = recurse( true, i )
end

puts "#{i} -> #{temp}"

