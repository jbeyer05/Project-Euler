
$sums = { 1 => [[ 1 ]] }

def num_sums( n )
  count = 0

  if $sums[n]
    return $sums[n]
  else
    puts "HERE FOR #{n}"
    $sums[n] = []

    (1..n-1).each do |i|
      num_sums( n - i ).each do |sum|
        $sums[n] << ( [i] + sum ).sort
      end
    end
  end

  $sums[n].uniq!

  return $sums[n]
end

require 'pp'
temp = num_sums( 10 )
pp $sums

$sums.each_pair do |k,v|
  puts "#{k} : #{v.length}"
end

puts
puts
#pp temp
puts temp.length
