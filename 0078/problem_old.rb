require 'pp'

$hash  = {}

def recurse( addends, add_sum, n )
  if add_sum == n
    1
  else
    start = [n-add_sum,addends.last].min

    sum = 0
    start.downto( 1 ) do |i|
      if $hash[[n - ( add_sum + i ),i]]
        sum += $hash[[n - ( add_sum + i ),i]]
      else
        sum += recurse( addends + [i], add_sum + i, n )
      end
    end

    $hash[[n - add_sum,addends.last]] = sum
    sum
  end
end


n = 2

while true
  piles = 1 + recurse( [n-1], 0, n )

  puts "n : #{n} piles : #{piles}"
  break if piles % 1_000_000 == 0
  n += 1
end

