
N = 1000

num   = 3
denom = 2

i     = 1
count = 0

while i <= N
  if num.to_s.length > denom.to_s.length
    count += 1
  end

  num  += denom
  temp  = num
  num   = denom
  denom = temp

  num  += denom

  i   += 1
end

puts count
