
N = 200

$m = { 1 => 0 }
$n = { }

def recurse( powers, target_power )
  return if powers.last > target_power

  powers.each do |p|
    if ! $m[ powers.last + p] || powers.length < $m[ powers.last + p ]
      $m[ powers.last + p] = powers.length
      $n[ powers.last + p] = [powers,[powers.last,p]]

      recurse( powers + [ powers.last + p ], target_power )
    end
  end
end


require 'pp'
recurse( [1], N )
pp $m
#pp $n

sum = 0

(1..N).each do |n|
  sum += $m[n]
end

puts sum

=begin

           1
          /
         2
        /
       4
      /
     8
    /\ \  \
   16 12 10 11

=end
