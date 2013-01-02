
$chain_end = []
$squares = []
$squares[48] = 0
$squares[49] = 1
$squares[50] = 4
$squares[51] = 9
$squares[52] = 16
$squares[53] = 25
$squares[54] = 36
$squares[55] = 49
$squares[56] = 64
$squares[57] = 81

def chain( n )
  ret = 0

  n.to_s.each_byte do |c|
    ret += $squares[c]
  end

  ret
end

count = 0

(1..999).each do |n|
  _n = n

  while n != 1 && n != 89
    n = chain( n )
    n = $chain_end[n] if $chain_end[n]
  end

  $chain_end[_n] = n

  count += 1 if n == 89
end

(1000..9999999).each do |n|
  while n != 1 && n != 89
    n = chain( n )
    n = $chain_end[n] if $chain_end[n]
  end

  count += 1 if n == 89
end


puts count
