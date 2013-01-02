require 'pp'

N = 6

def recurse( set, orders_free )
  if set.length == N
    if set.last.to_s[2,2] == set.first.to_s[0,2]
      orders_found = []

      set.each do |n|
        (0..N-1).each do |o|
          if $polygonal[o].index( n )
            orders_found << o
          end
        end
      end

      if orders_found.uniq.sort == (0..N-1).to_a && orders_found.first == 0
        pp set
        pp orders_found
        pp orders_free
        sum = 0
        set.each do |i|
          sum += i
        end
        puts sum
      end
    end
  else
    if $links[set.last]
      $links[set.last].keys.each do |key|
        orders_free.each do |order|
          if $polygonal[order].index( key )
            recurse( set + [key], orders_free - [order] )
          end
        end
      end
    end
  end
end

$polygonal = [[1],[1],[1],[1],[1],[1]]

(0..N-1).each do |i|
  j = 2

  while $polygonal[i].last < 10_000
    $polygonal[i] << j * ( ( i + 1 ) * j + 1 - i ) / 2
    j += 1
  end

  $polygonal[i].delete_if do |ele|
    ele < 1_000 || ele >= 10_000
  end
end


$all_nums = $polygonal.flatten.uniq
$links = {}

$all_nums.each do |i|
  $all_nums.each do |j|
    if i.to_s[2,2] == j.to_s[0,2]
      if ! $links[i]
        $links[i] = { j => true }
      else
        $links[i][j] = true
      end
    end
  end
end


$all_nums.each do |i|
  (0..N-1).each do |o|
    if $polygonal[o].index( i )
      recurse( [i], [0,1,2,3,4,5] - [o] )
    end
  end
end

