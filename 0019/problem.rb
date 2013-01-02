
date_walker = Date.parse( '1901-01-01' )

count = 0

while date_walker <= Date.parse( '2000-12-31' )
  if date_walker.day == 1 && date_walker.wday == 0
    count += 1
  end

  date_walker += 1
end

puts count
