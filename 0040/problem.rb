
fraction = " "
i = 1

while fraction.length < 1000001
  fraction += i.to_s
  i += 1
end

require 'pp'
pp [ fraction[1].chr.to_i, fraction[10].chr.to_i, fraction[100].chr.to_i, fraction[1000].chr.to_i, fraction[10000].chr.to_i, fraction[100000].chr.to_i ]

puts fraction[1].chr.to_i * fraction[10].chr.to_i * fraction[100].chr.to_i * fraction[1000].chr.to_i * fraction[10000].chr.to_i * fraction[100000].chr.to_i * fraction[1000000].chr.to_i
