require 'pp'

N = 1_000_000_000

=begin
$odd = []
$odd['1'.ord] = true
$odd['3'.ord] = true
$odd['5'.ord] = true
$odd['7'.ord] = true
$odd['9'.ord] = true
ODD = { '1'[0] => true, '3'[0] => true, '5'[0] => true, '7'[0] => true, '9'[0] => true }
=end

$odds = {}

il2 = [1*10**2,3*10**2,5*10**2,7*10**2,9*10**2]
il3 = [1*10**3,3*10**3,5*10**3,7*10**3,9*10**3]
il4 = [1*10**4,3*10**4,5*10**4,7*10**4,9*10**4]
il5 = [1*10**5,3*10**5,5*10**5,7*10**5,9*10**5]
il6 = [1*10**6,3*10**6,5*10**6,7*10**6,9*10**6]
il7 = [1*10**7,3*10**7,5*10**7,7*10**7,9*10**7]
il8 = [1*10**8,3*10**8,5*10**8,7*10**8,9*10**8]

[0,1,2,3,4,5,6,7,8,9].each do |d1|
  [0,10,20,30,40,50,60,70,80,90].each do |d2|
    il2.each do |d3|
      il3.each do |d4|
        il4.each do |d5|
          il5.each do |d6|
            il6.each do |d7|
              il7.each do |d8|
                il8.each do |d9|
                end
              end
            end
          end
        end
      end
    end
  end
end

pp [$odds.keys.length,$odds.keys.sort.last]


start_time = Time.now
count  = 0
walker = 0
exp = 0
next_plateau = 10
plateau      = 1

(1..N-1).each do |i|
  puts "* #{i} : #{count} : #{walker}" if i % 100_000 == 0

  if i % 10 == 0
    walker = i + i.to_s.reverse.to_i

=begin
    if i >= next_plateau
      next_plateau *= 10
      plateau      *= 10
    end

    puts "ABOUT TO FIND REVERSE OF i = #{i}, plateau = #{plateau}, reverse of #{i % plateau} is #{$reverse[i % plateau]}"
    reverse = $reverse[i % plateau] * 10
    reverse += ( i / plateau )
    $reverse[i] = reverse
    walker = i + reverse
    if walker != i + i.to_s.reverse.to_i
      puts "FOR i = #{i}, WALKER IS #{walker}, against #{i + i.to_s.reverse.to_i}"
    end
=end
  else
    walker += 1
    if i >= next_plateau
      next_plateau *= 10
      plateau      *= 10
    end
    walker += plateau

    if $odds[walker]
      count += 1
    end
  end


=begin
  if i % 10 != 0 && $odds[i + i.to_s.reverse.to_i]
    count += 1
  end
=end
end

puts count
puts "TOOK #{Time.now - start_time} seconds"
