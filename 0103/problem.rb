require 'pp'
require 'array_stat'

=begin
def special?( set )
  set.sort!

  midpoint = ( set.length ) / 2

#  return nil if set[0..midpoint].sum <= set[midpoint+1..-1].sum

  if set[0..midpoint].sum <= set[midpoint+1..-1].sum
    return nil
  end

  sums = {}

  permutations = []
  (1..set.length-1).each do |l|
    array = set.permutation( l ).to_a
    array.map! do |ele|
      ele.sort
    end

    permutations += array.uniq
  end

  permutations.each do |permutation|
    sum = permutation.sum

    if sums[sum]
      return nil
    else
      sums[sum] = true
    end
  end
end
=end

def special?( set )
  set.sort!

  sums = {}
  max  = []
  min  = []

  combinations = []
  (1..set.length-1).each do |l|
    combinations += set.combination( l ).to_a
  end

  combinations.each do |combination|
    len = combination.length
    sum = combination.sum

    if ! max[len] || sum > max[len]
      max[len] = sum
    end

    if ! min[len] || sum < min[len]
      min[len] = sum
    end

    if sums[sum]
      relevant_combinations = sums[sum]
      relevant_combinations.each do |relevant_combo|
        if ( relevant_combo + combination ).uniq.length == ( relevant_combo + combination ).length
          sums[sum] << combination
          return nil
        end
      end

      sums[sum] << combination
    else
      sums[sum] = [combination]
    end
  end

  (2..(set.length-1)).each do |i|
    if min[i] <= max[1..(i-1)].max
      return nil
    end
  end

  true
end

def generate_near_optimum_set( n )
  if n == 1
    [1]
  else
    near_optimum = generate_near_optimum_set( n - 1 )
    ret = []
    mid = near_optimum[near_optimum.length / 2]

    (0..(n-1)).each do |i|
      if i == 0
        ret << mid
      else
        ret << mid + near_optimum[i-1]
      end
    end

    ret
  end
end

$o = 0
def dfs( path, max_path_length )
  $o += 1
#  puts "checking #{path.to_s}" if $o % 1000 == 0

  if path.length == max_path_length
    if special?( path ) && path.sum < $lowest_S 
      puts "HERE"
      $lowest_special = path
      $lowest_S = path.sum
    end

    return
  end

  n = path[-1] + 1

  while path.sum + (n..( n + ( N - path.length - 1 ))).to_a.sum < $lowest_S
#  while path.sum + n < $lowest_S
    dfs( path + [n], max_path_length )
    n += 1
  end
end


N = ARGV[0].to_i
n = 5

near_optimum = generate_near_optimum_set( N )
$lowest_special = near_optimum.dup
$lowest_S = near_optimum.sum

puts "NEAR OPTIMUM:"
pp $lowest_special
puts "sum of #{$lowest_S}"
puts $lowest_special.join( '' )
puts

dfs( [near_optimum[0]], N )


pp $lowest_special
puts "sum of #{$lowest_S}"
puts $lowest_special.join( '' )
exit


pp near_optimum
tested_sets = []

while true
  all_sums_too_high = true
  sets = []
  puts "NEW SETS"
  n += 1
  time_start = Time.now

  sets += (near_optimum[0]..n).to_a.combination( N ).to_a

  sets.map! do |set|
    set.sort
  end

  sets -= tested_sets

  puts "TOOK #{Time.now - time_start} SECONDS TO GENERATE SETS"

  pp sets

  time_start = Time.now

  sets.each do |set|
    if set.sum < min_S
      all_sums_too_high = nil

      if special?( set )
        STDERR.puts set.to_s
        STDERR.puts "IS SPECIAL"
        exit
      end

      puts "IS NOT SPECIAL " + PP.pp( set, '' )
    else
      puts "SUM IS TOO HIGH " + PP.pp( set, '' )
    end
  end

  tested_sets += sets

  puts "TOOK #{Time.now - time_start} SECONDS TO TEST SETS"

  if sets.length != 0 && all_sums_too_high
    STDERR.puts near_optimum.to_s
    STDERR.puts "IS THE MINIMAL SPECIAL SET"
    exit
  end
end

