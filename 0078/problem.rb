require 'pp'

N = 80_000
n = 2

$p    = { 1 => 1, 2 => 2 }
$pent = { 1 => 1 }

def pent( _i )
  if $pent[_i]
    $pent[_i]
  else
    start = $pent.keys.sort.last
    (start+1..start*2).each do |_j|
      j = _j + 1
      j /= 2
      j *= -1 if _j % 2 == 0

      $pent[_j] = ( 3 * j - 1 ) * j / 2
    end

    $pent[_i]
  end
end

while n < N
  _p = 0
  i = 1

  while n - pent( i ) > 0
    if (( i + 1 ) / 2 ) % 2 == 0
      _p -= $p[n-pent( i )]
    else
      _p += $p[n-pent( i )]
    end

    i += 1
  end

  $p[n] = _p

  if _p % 1_000_000 == 0
    puts n
    puts _p
    exit
  end

  n += 1
end

