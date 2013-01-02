require 'pp'
require 'array_stat'
#require 'ruby-prof'
require 'inline'

class Array
  inline do |builder|
    builder.c "
      VALUE quick_access( int index ) {
        return rb_ary_entry( self, index );
      }"
  end

  inline do |builder|
    builder.c "
      int quick_sum( )
      {
        int len, sum, i;
        len = RARRAY_LEN( self );
        sum = 0;

        for( i = 0; i < len; i++ )
        {
          sum += FIX2INT( rb_ary_entry( self, i ));
        }

        return sum;
      }"
  end

  inline do |builder|
    builder.include '"ruby.h"'

    builder.c "
      VALUE quick_add_sort_any_duplicates( VALUE combination )
      {
        int n;
        VALUE temp = rb_ary_plus( self, combination );
        rb_ary_sort_bang( temp );

        n = 1;
        while( n < RARRAY_LEN( temp ))
        {
          if( FIX2LONG( rb_ary_entry( temp, n - 1 )) == FIX2LONG( rb_ary_entry( temp, n )))
            break;
          n += 1;
        }

        if( n == RARRAY_LEN( temp ))
          return Qnil;
        else
          return Qtrue;
      }"
    end
end


def dominates?( b_set, c_set )
  (0..( b_set.length - 1 )).each do |i|
    return nil if b_set[i] < c_set[i]
  end

  true
end

N = ARGV[0].to_i
ARRAY = (0..(N-1)).to_a

$compare_sets = []

n = 2
while n <= N / 2
  b_sets = ARRAY.combination( n ).to_a

  b_sets.each do |b_set|
    c_basket = ARRAY - b_set

    c_sets = c_basket.combination( n ).to_a
    c_sets.delete_if do |c_set|
      b_set[0] < c_set[0] || dominates?( b_set, c_set )
    end

    c_sets.each do |c_set|
      $compare_sets << [b_set,c_set]
#      puts "#{PP.pp( b_set, '' ).chomp}, #{PP.pp( c_set, '' ).chomp}"
    end
  end

  n += 1
end

def new_special?( set )
  set.sort!

  sums = {}
  max  = []
  min  = []

  combinations = []
  (1..N-1).each do |l|
    combinations += set.combination( l ).to_a
  end

  combinations.each do |combination|
    len = combination.length
    sum = combination.quick_sum

    if ! max[len] || sum > max[len]
      max[len] = sum
    end

    if ! min[len] || sum < min[len]
      min[len] = sum
    end
  end

  (2..(set.length-1)).each do |i|
    if min[i] <= max[1..(i-1)].max
      return nil
    end
  end

  $compare_sets.each do |compare_set|
=begin
    b_set = compare_set[0]
    c_set = compare_set[1]

    sum_b = 0
    sum_c = 0

    b_set.each do |b_index|
      sum_b += set[b_index-1]
    end

    c_set.each do |c_index|
      sum_c += set[c_index-1]
    end

    return nil if sum_b == sum_c
=end

#    pp compare_set[0]
#    pp compare_set[1]
#    pp set.values_at( * compare_set[0] )
#    pp set.values_at( * compare_set[1] )
#    puts
    bool = set.values_at( * compare_set[0] ).sum == set.values_at( * compare_set[1] ).sum
    if bool
      return nil
    end
  end

  true
end

def special?( set )
  set.sort!

  sums = Array.new( $lowest_S )
  max  = []
  min  = []

  combinations = []
  (1..(N-1)).each do |l|
    combinations += set.combination( l ).to_a
  end

  combinations.each do |combination|
    len = combination.length
    sum = combination.quick_sum

    if ! max[ len ] || sum > max[ len ]
      max[len] = sum
    end

    if ! min[ len ] || sum < min[ len ]
      min[len] = sum
    end

    if sums[ sum ]
=begin
      if ! sums[sum].quick_add_sort_any_duplicates( combination )
        return nil
      end
=end

      temp = sums[sum] + combination
      temp.sort!

      if temp.length == temp.uniq.length
        return nil
      end

      sums[sum] = ( sums[sum] + combination ).uniq
    else
      sums[sum] = combination
    end

=begin
    if sums[ sum ]
      sums[ sum ].each do |relevant_combo|
        if ( relevant_combo + combination ).uniq.length == ( relevant_combo + combination ).length
          return nil
        end
      end

      sums[sum] << combination
    else
      sums[sum] = [combination]
    end
=end
  end

  (2..(N-1)).each do |i|
    if min[ i ] <= max[1..(i-1)].max
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

def dfs( path, max_path_length, sum, len )
  if len == max_path_length
    if sum < $lowest_S && special?( path )
      puts "HERE"
      $lowest_special = path
      $lowest_S = sum
    end

    return
  end

  n = path[-1] + 1

  while sum + ( N - len ) * ( n + n + N - len - 1 ) / 2 < $lowest_S
    dfs( path + [n], max_path_length, sum + n, len + 1 )
    n += 1
  end
end


n = 5

$near_optimum = generate_near_optimum_set( N )
$lowest_special = $near_optimum.dup
$lowest_S = $near_optimum.sum

puts "NEAR OPTIMUM:"
pp $lowest_special
puts "sum of #{$lowest_S}"
puts $lowest_special.join( '' )
puts

#RubyProf.start
#RubyProf.pause
dfs( [$near_optimum[0]], N, $near_optimum[0], 1 )
#result = RubyProf.stop

#RubyProf::FlatPrinter.new( result ).print( STDOUT, {} )


pp $lowest_special
puts "sum of #{$lowest_S}"
puts $lowest_special.join( '' )
exit


pp $near_optimum
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

