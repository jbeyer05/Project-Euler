
count = 0

(1..25).each do |power|
  lower = (( 10 ** ( power - 1 )) ** ( 1.0 / power )).ceil
  upper = 10

  count += upper - lower

  puts "#{upper - lower} for #{power}"
end

puts count
