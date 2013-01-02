require 'pp'
require 'array_stat'


def dominates?( b_set, c_set )
  (0..( b_set.length - 1 )).each do |i|
    return nil if b_set[i] < c_set[i]
  end

  true
end


N = 7
ARRAY = (1..N).to_a
num = 0

n = 2
while n <= N / 2
  b_sets = ARRAY.combination( n ).to_a

  b_sets.each do |b_set|
    c_basket = ARRAY - b_set

    c_sets = c_basket.combination( n ).to_a
    c_sets.delete_if do |c_set|
      b_set[0] < c_set[0] || dominates?( b_set, c_set )
    end

    num += c_sets.length

    c_sets.each do |c_set|
      puts "#{PP.pp( b_set, '' ).chomp}, #{PP.pp( c_set, '' ).chomp}"
    end
  end

  n += 1
end

puts num
