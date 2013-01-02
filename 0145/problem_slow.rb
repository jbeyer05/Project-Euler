require 'pp'

N = 10_000_000

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

[1,3,5,7,9].each do |d1|
  $odds[d1] = true

  [10,30,50,70,90].each do |d2|
    puts "HERE FOR #{d2}"

    p2 = d2 + d1
    $odds[p2] = true

    il2.each do |d3|
      p3 = d3 + p2
      $odds[p3] = true

      il3.each do |d4|
        p4 = d4 + p3
        $odds[p4] = true

        il4.each do |d5|
          p5 = d5 + p4
          $odds[p5] = true

          il5.each do |d6|
            p6 = d6 + p5
            $odds[p6] = true

            il6.each do |d7|
              p7 = d7 + p6
              $odds[p7] = true

              il7.each do |d8|
                p8 = d8 + p7
                $odds[p8] = true

                il8.each do |d9|
                  p9 = d9 + p8
                  $odds[p9] = true
                end
              end
            end
          end
        end
      end
    end
  end
end


def reverse( i )
  ret = 0

  until i == 0
    ret *= 10
    ret += i % 10
    i   /= 10
  end

  ret
end

start_time = Time.now
count  = 0
walker = 0
exp = 0
next_plateau = 10
plateau      = 1

(1..N-1).each do |i|
  puts "* #{i} : #{count} : #{walker}" if i % 100_000 == 0

  if i % 10 == 0
    walker = i + reverse( i )

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
