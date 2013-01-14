require 'pp'

if ARGV[0]
  N = ARGV[0].to_i
else
  N = 20
end

=begin
prob =
{
       (anything but 0) * (one matching plate)
  2 => 999 / 1000.0     * 1 / 1000.0
  2 => 0.000999
  3 => 0.001994004


0             => 0.001
u1            => 0.999
0,0           => 0.001 * 0.001
0,u1          => 0.001 * 0.999

u1,0          => 0.999 * 0.001
u1,u1         => 0.999 * 0.001
u1,m          => 0.999 * 0.001
u1,u2         => 0.999 * 0.997

0,u1,m        => 0.001 * 0.999 * 0.001

u1,u2,m       => 0.999 * 0.997 * 0.002

u1,0,m        => 0.999 * 0.001 * 0.001

u1,u1,m       => 0.999 * 0.001 * 0.001

*,*,m         => 0.000000999 + 0.001992006 + 0.000000999 + 0.000000999
              => 0.001995003

( 0.001 * 0.000999 ) + ( 0.999 * ( 0.002 * 0.001 ) + ( 0.997 * 0.002 ) )
0.000000999 + 0.999 * ( 0.000002 + 0.001994 )
0.000000999 + 0.999 * 0.001996
0.000000999 + 0.001994004



0,5,u1,m

0             => 0.001
5             => 0.001
u1            => 0.998

0,0           => 0.001 * 0.001
0,5           => 0.001 * 0.001
0,u1          => 0.001 * 0.998

5,0           => 0.001 * 0.001
5,m           => 0.001 * 0.001
5,u1          => 0.001 * 0.998

u1,0          => 0.998 * 0.001
u1,5          => 0.998 * 0.001
u1,u2         => 0.998 * 0.997
u1,m          => 0.998 * 0.001


0,5,m         => 0.001 * 0.001 * 0.001
0,u1,m        => 0.001 * 0.998 * 0.001
5,0,m         => 0.001 * 0.001 * 0.001
5,u1,m        => 0.001 * 0.998 * 0.002

u1,0,m        => 0.998 * 0.001 * 0.001
u1,5,m        => 0.998 * 0.001 * 0.002
u1,u2,m       => 0.998 * 0.997 * 0.002

*,*,m         => 0.001 * ( 0.001 * 1 + 0.998 * 0.002 ) + 0.998 * ( 0.001 * 0.003 + 0.997 * 0.002 )
              => 0.001 * ( 0.002996 )                  + 0.998 * ( 0.001997 )
              => 0.000002996 + 0.001993006
              => 0.001996002







=end

$hash = {}

def dfs( max_plates, plates_seen, unique_non_zeros )
  if $hash[max_plates-plates_seen] && $hash[max_plates-plates_seen][unique_non_zeros]
#    puts "dfs( #{max_plates}, #{plates_seen}, #{unique_non_zeros} ) = #{ $hash[max_plates-plates_seen][unique_non_zeros] }"
    print $hash[max_plates-plates_seen][unique_non_zeros]
    return $hash[max_plates-plates_seen][unique_non_zeros]
  end

  if plates_seen + 1 == max_plates
    if ! $hash[max_plates-plates_seen]
      $hash[max_plates-plates_seen] = {}
    end
    $hash[max_plates-plates_seen][unique_non_zeros] = unique_non_zeros / 1000.0

    print "#{unique_non_zeros / 1000.0}"
#    puts "dfs( #{max_plates}, #{plates_seen}, #{unique_non_zeros} ) = #{ unique_non_zeros / 1000.0 }"
    return unique_non_zeros / 1000.0
  else
    sum_probs = 0.0
    # probability of getting either a zero or getting a non-zero number that we have already seen, and NOT getting a match
    delta1 = (( 1 + unique_non_zeros ) / 1000.0 )
    print "( #{delta1} * ("
    delta2 = dfs( max_plates, plates_seen + 1, unique_non_zeros )
    print " )) + "
#      puts "  !nu #{max_plates},#{plates_seen},#{unique_non_zeros} : #{delta1} * #{delta2} = #{delta1 * delta2}"
    sum_probs += delta1 * delta2

    # probability of new unique, that DOES NOT produce a match
    delta1 = (( 999 - unique_non_zeros - unique_non_zeros ) / 1000.0 )
    print "( #{delta1} * ("
    delta2 = dfs( max_plates, plates_seen + 1, unique_non_zeros + 1 )
    print " ))"
#      puts "  nu  #{max_plates},#{plates_seen},#{unique_non_zeros} : #{delta1} * #{delta2} = #{delta1 * delta2}"
    sum_probs += delta1 * delta2

    if ! $hash[max_plates-plates_seen]
      $hash[max_plates-plates_seen] = {}
    end
    $hash[max_plates-plates_seen][unique_non_zeros] = sum_probs

#    puts "dfs( #{max_plates}, #{plates_seen}, #{unique_non_zeros} ) = #{sum_probs}"
    return sum_probs
  end
end


sum = 0

(2..N).each do |n|
  temp = dfs( n, 0, 0 )
  sum += temp * n
  puts
  puts
  puts "probability of matching plate after #{n} : #{temp}, EV contribution = #{temp * n}"
  puts
end

puts sum
#pp $hash


