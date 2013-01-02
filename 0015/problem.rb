require 'pp'

N = 20

$paths = [[1]]

(1..N).each do |step|
  last_path = $paths.last
  $paths << []

  last_path.each_index do |i|
    if i == 0
      $paths.last << 1
      next
    end
    $paths.last << last_path[i] + last_path[i-1]
  end

  $paths.last << 1
end

(1..N).each do |step|
  last_path = $paths.last
  $paths << []

  last_path.each_index do |i|
    next if i == 0
    $paths.last << last_path[i] + last_path[i-1]
  end
end

pp $paths
