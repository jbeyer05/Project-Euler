require 'pp'

def recurse( blocks_remaining, stack = [] )
  return 1 if blocks_remaining < 2
  return $h[blocks_remaining] if $h[blocks_remaining]

  sum = ( stack == [] ) ? 0 : 1

  (2..4).each do |length|
    (0..blocks_remaining-length).each do |gap|
      sum += recurse( blocks_remaining - gap - length, stack + [gap,length] )
    end
  end

  $h[blocks_remaining] = sum
  sum
end


$h = {}
sum = recurse( 50 ) + 1

puts sum
