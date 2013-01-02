require 'pp'

$pentagonals  = [0]
$pent_reverse = {}

N     = 10000
min_D = nil

(1..1.000001*N).each do |n|
  $pentagonals << n * ( 3 * n - 1 ) / 2
  $pent_reverse[n * ( 3 * n - 1 ) / 2 ] = n
end


(1..N).each do |j|
  (j+1..N).each do |k|
    if $pent_reverse[ $pentagonals[k] + $pentagonals[j]] &&
       $pent_reverse[ $pentagonals[k] - $pentagonals[j]]
      puts "#{$pentagonals[k]} #{$pentagonals[j]}"

      if ! $min_D || ( $pentagonals[k] - $pentagonals[j] < min_D )
        min_D = $pentagonals[k] - $pentagonals[j]
      end
    end
  end
end

puts min_D
