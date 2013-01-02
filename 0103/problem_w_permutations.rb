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


N = 6
n = 5
#sets = []

while true
  sets = []
  puts "NEW SETS"
  n += 1
  time_start = Time.now
  sets += (12..n).to_a.permutation( N - 1 ).to_a

  sets.map! do |set|
    set = [11] + set.sort
  end

  sets.uniq!

  puts "TOOK #{Time.now - time_start} SECONDS TO GENERATE SETS"

  pp sets

  time_start = Time.now

  sets.each do |set|
    if special?( set )
      STDERR.puts set.to_s
      STDERR.puts "IS SPECIAL"
      exit
    end

    puts "IS NOT SPECIAL " + PP.pp( set, '' )

=begin
    if set[-1] - set[0] == set.length - 1
      set = (1..set.length-1).to_a + [set[-1] + 1]
    else
      i = 0

      while n < set.length
        if set[i] != set[i+1] - 1
          set[i] += 1
          break
        end

        i += 1
      end
    end

    puts "# IS NOT SPECIAL " + PP.pp( set, '' )
=end
  end

  puts "TOOK #{Time.now - time_start} SECONDS TO TEST SETS"
end

