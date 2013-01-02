
fibs = [ 1, 1 ]

while fibs.last < 10**999
  fibs << fibs[-1] + fibs[-2]
end

puts fibs.length
puts fibs.last
