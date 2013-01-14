require 'pp'
#require 'ruby-prof'

N = 1 * 10 ** ARGV[0].to_i
$checked = Array.new( N, false )

$primes = Array.new( N.to_i, true )
$prime_array = []

$sum = 0

def prime_sieve( n )
  (2..( n ** 0.51 ).to_i).each do |i|
    next if ! $primes[i]

#    puts "SIEVING #{i}"

    (2..n/i).each do |j|
      $primes[i*j] = false
    end
  end
end

prime_sieve( N )


(2..N).each do |n|
  $prime_array << n if $primes[n]
end

puts "DONE GENERATING PRIMES"

def square?( n )
  ( n ** 0.5 ).to_i == ( n ** 0.5 )
end

def factor( n )
  factors = []

  (1..n).each do |i|
    factors << i if n % i == 0
  end

  factors
end

factor_cnt = 0
s_factor_cnt = 0


def dfs( factors, n )
#  puts "dfs( #{factors.join( ',' )}, #{n} )"
#  return if $checked[n]

  $checked[n] = true

  ss_factors = 0
  factors.each do |factor|
    ss_factors += factor * factor
  end

  if square?( ss_factors )
    $sum += n
  end

  prime_index = 0
  new_factor = $prime_array[prime_index]

  while new_factor && ( n * new_factor < N )
    if ! $checked[ n * new_factor ]
      new_factors = factors.dup
      factors.each do |factor|
        new_factors << factor * new_factor
      end

      new_factors.uniq!

      dfs( new_factors, n * new_factor )
    end

    prime_index += 1
    new_factor = $prime_array[prime_index]
  end
end

#RubyProf.start

dfs( [1], 1 )
puts $sum

#result = RubyProf.stop
#RubyProf::GraphPrinter.new( result ).print( STDOUT, {} )

exit


(1..(N-1)).each do |n|
#  puts "SKIPPING #{n}" if checked[n]
  next if $checked[n]

#  puts "FACTORING #{n}"
  factor_cnt += 1

  factors = factor( n )
#  pp factors

  ss_divisors = factors.inject( 0 ) { |sum, n| sum + n * n }
  $checked[n] = true

  if square?( ss_divisors )
    $meets_condts[n] = true
    $sum += n
  end

  new_factor_index = 0
  new_factor = $prime_array[new_factor_index]

  while new_factor && ( n * new_factor ) < N
#    puts "SHORTCUT FACTORING #{ n * new_factor }"
    s_factor_cnt += 1
    new_factors = factors.dup
    factors.each do |factor|
      new_factors << factor * new_factor
    end

    new_factors.uniq!

#    pp new_factors

    ss_divisors = new_factors.inject( 0 ) { |sum, n| sum + n * n }
    $checked[n*new_factor] = true

    if square?( ss_divisors )
      $meets_condts[n*new_factor] = true
      $sum += n * new_factor
    end

    new_factor_index += 1
    new_factor = $prime_array[new_factor_index]
  end
end


puts "FULL #{factor_cnt}, SHORTCUT #{s_factor_cnt}"
puts $sum
