
words = []

File.readlines( '0042/words.txt' )[0].split( ',' ).each do |str|
  words << str[1..-2]
end

count = 0
$triangles = {}

(1..1000).each do |i|
  $triangles[ i * ( i + 1 ) / 2 ] = true
end

words.each do |word|
  sum = 0

  word.each_byte do |b|
    sum += b - 'A'[0] + 1
  end

  count += 1 if $triangles[sum]
end

puts count
