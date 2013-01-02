
$fact = [1,1]

def choose( n, r )
  $fact[n] / ( $fact[r] * ( $fact[n-r] ))
end

count = 0

(2..100).each do |i|
  $fact << $fact.last * i
end

(1..100).each do |n|
  (1..100).each do |r|
    count += 1 if choose( n, r ) > 1000000
  end
end

puts count
