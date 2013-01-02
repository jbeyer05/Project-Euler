require 'pp'

N = ARGV[0].to_i
SIEVE_STEP = ARGV[1].to_i # 10**5

start_time = Time.now

def prime_sieve( range_low )
  range_high = range_low + SIEVE_STEP

  if range_low == 0
    (2..( range_high ** 0.501 ).to_i).each do |i|
#      puts "SIEVING #{i}" if range_low != 0

      (range_low/i..range_high/i).each do |j|
        next if j == 1 || i*j < range_low || i*j > range_high
        $primes[i*j-range_low] = false
      end
    end
  else
    $prime.each do |i|
      break if i*i > range_high

      (range_low/i..range_high/i).each do |j|
        next if j == 1 || i*j < range_low || i*j > range_high
        $primes[i*j-range_low] = false
      end
    end
  end
end

$prime      = []
$prime_hash = {}

range_low = 0
while range_low < N
  $primes = Array.new( SIEVE_STEP, true )
  prime_sieve( range_low )

  $primes.each_index do |i|
    if $primes[i]
      $prime << i + range_low
      $prime_hash[i + range_low] = true
    end
  end

  if range_low == 0
    $prime.delete( 0 )
    $prime.delete( 1 )
    $prime_hash.delete( 0 )
    $prime_hash.delete( 1 )
  end

  range_low += SIEVE_STEP
end


$primes = nil
GC.start
puts "CREATED PRIMES IN #{Time.now - start_time} seconds"
start_time = Time.now
$links = {}

$prime.each do |p|
  $links[p] = {}
end

(0..$prime.length-1).each do |i|
  a_i = $prime[i]
  a   = a_i.to_s
  next if a.length > N.to_s.length / 2

  (i..$prime.length-1).each do |j|
    b_i = $prime[j]
    b   = b_i.to_s
    break if a.length + b.length > N.to_s.length

    if $prime_hash[( a + b ).to_i] && $prime_hash[( b + a ).to_i]
      $links[a_i][b_i] = true
      $links[b_i][a_i] = true
    end
  end
end

puts "FOUND ALL PRIME PAIRS IN #{Time.now - start_time} seconds"
start_time = Time.now
lowest_sum = 10_000_000
lowest_set = nil

$links.each_pair do |a,a_links|
  break if a > lowest_sum

  a_links.each_key do |b|
#    puts "#{a},#{b}"
    break if a + b > lowest_sum

    $links[b].each_key do |c|
#      puts "#{a},#{b},#{c}"
      break if a + b + c > lowest_sum

      if $links[c][a]
        $links[c].each_key do |d|
#          puts "#{a},#{b},#{c},#{d}"
          break if a + b + c + d > lowest_sum

          if $links[d][a] && $links[d][b]
            $links[d].each_key do |e|

              if $links[e][a] && $links[e][b] && $links[e][c] && a + b + c + d + e < lowest_sum
                lowest_sum = a + b + c + d + e
                lowest_set = [a,b,c,d,e]
              end
            end
          end
        end
      end
    end
  end
end


puts "TOOK #{Time.now - start_time} seconds"
puts
pp lowest_set
puts lowest_sum
