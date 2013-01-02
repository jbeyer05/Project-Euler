require 'pp'

def recurse( blocks_remaining, stack = [] )
#  pp stack if blocks_remaining < $m
  return 1 if blocks_remaining < $m
  return $h[blocks_remaining] if $h[blocks_remaining]

#  pp stack + [blocks_remaining] if stack != []
  sum = ( stack == [] ) ? 0 : 1

  (0..blocks_remaining-$m).each do |gap|
    sum += recurse( blocks_remaining - gap - $m, stack + [gap,$m] )
  end

  $h[blocks_remaining] = sum
  sum
end

$m = 2
$h = {}
sum = recurse( 50 )

$m = 3
$h = {}
sum += recurse( 50 )

$m = 4
$h = {}
sum += recurse( 50 )

puts sum
