require 'pp'
require 'array_stat'

=begin
def special?( set )
  set.sort!

  midpoint = ( set.length ) / 2

  # test property ii)
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

def old_special?( set )
  set.sort!

  midpoint = ( set.length ) / 2

  # test property ii)
  if set[0..midpoint].sum <= set[midpoint+1..-1].sum
    puts "HERE"
    return nil
  end

  sums = {}

  combinations = []
  (1..set.length-1).each do |l|
    combinations += set.combination( l ).to_a
  end

  combinations.each do |combination|
    sum = combination.sum

    if sums[sum]
      return nil
    else
      sums[sum] = [combination]
    end
  end

  true
end

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


master_sum = 0
lines = File.readlines( 'sets.txt' )

lines.each do |line|
  set = line.split( ',' )

  set.map! do |num|
    num.to_i
  end

  is_special = special?( set )

  puts PP.pp( set, '' ) + ( is_special ? ' IS SPECIAL' : ' IS NOT SPECIAL' )
  puts

  master_sum += set.sum if is_special
end

puts
puts master_sum


