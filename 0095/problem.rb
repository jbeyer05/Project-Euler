require 'pp'

N = 1_000_000

$div = {}
$map = {}
max_length = 0
smallest_num = nil

(1..N-1).each do |n|
  sum = 1
  $div[n] = [1]

  (2..(( n + 1 )**0.5).to_i).each do |i|
    if n % i == 0
      $div[n] << i
      $div[n] << n / i

      sum += i + n / i
    end
  end

  $map[n] = sum
end

(1..N-1).each do |n|
  step  = n
  chain = []

  while step != 1 && step < N && ! chain.index( step )
    chain << step

#    print "#{step} -> "
    step = $map[step]

    if step == n
      chain << step

      if chain.length >= max_length
        if chain.length > max_length
          smallest_num = chain.first
        end
        chain.each do |i|
          if i < smallest_num
            smallest_num = i
          end
        end

        puts "#{n} is amicable, length = #{chain.length}\n"
        max_length = chain.length
      end

      break
    end
  end
end

puts smallest_num
