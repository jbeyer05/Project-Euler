
names = []

def score( name )
  sum = 0
  name.each_byte do |b|
    sum += b - 'A'[0] + 1
  end

  sum
end

File.readlines( '0022/names.txt' )[0].split( ',' ).each do |str|
  names << str[1..-2]
end

names.sort!
sum = 0

names.each_index do |i|
  sum += score( names[i] ) * ( i + 1 )
end

puts sum
