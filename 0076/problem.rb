require 'pp'

N      = 100
$count = 0

$hash  = {}

def recurse( addends, add_sum, n )
  if add_sum == n
    1
  elsif $hash[[n - add_sum,addends.last]]
    $hash[[n - add_sum,addends.last]]
  else
    start = [n-add_sum,addends.last].min

    sum = 0
    start.downto( 1 ) do |i|
      sum += recurse( addends + [i], add_sum + i, n )
    end

    $hash[[n - add_sum,addends.last]] = sum
    sum
  end
end

puts recurse( [N-1], 0, N )

