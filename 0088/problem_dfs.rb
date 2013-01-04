require 'pp'

def dfs( path, len, sum, product, max_n )
  if len == $k
    if sum == product
      pp path
    end
  else
    ((path.last)..max_n).each do |i|
      dfs( path + [i], len + 1, sum + i, product * i, max_n )
    end
  end
end

MAX_N = 10

(2..20).each do |k|
  $k = k
  (1..MAX_N).each do |n|
    dfs( [n], 1, n, n, MAX_N )
  end
end
