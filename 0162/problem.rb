require 'pp'

=begin
xx123 13*13*6
x1x23 13*14*6
x12x3 13*15*6
x123x 13*16*6
1xx23 14*14*4
1x2x3 14*15*4
1x23x 14*16*4
12xx3 15*15*4
12x3x 15*16*4
123xx 16*16*4

<=5   <=4 = precisely 5
10190-262 = 9928

<=4   <=3   precisely 4
262 - 4   = 258

TODO
generate all permutations (xx123,x1x23,x12x3,etc)
x can be 13,14,15 or 16 letters depending on number of [1,2,3] to left of x
if 1 is leading, 123 can only be 10A,1A0,A01 or A10.  No leading 0's!!!!
=end


digits = 16
cnt    = 0

def num_of_length( n )
  sum = 0

  (1..n).to_a.combination( 3 ).to_a.each do |xyz_pos|
    prod = 1

    prod *= ( xyz_pos[0] == 1 ? 4 : 6 )

    (1..n).each do |_n|
      if xyz_pos[0] == _n
        xyz_pos = xyz_pos[1..-1]
      else
        if xyz_pos == []
          prod *= 16
        else
          prod *= 16 - xyz_pos.length
        end
      end
    end

    sum += prod
  end

  sum
end

(3..digits).each do |n|
  ret = num_of_length( n )
  puts "#{ret} of length #{n}"

  cnt += ret
end

puts cnt
puts cnt.to_s( 16 ).upcase
