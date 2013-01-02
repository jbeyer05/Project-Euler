=begin

If a box contains twenty-one coloured discs, composed of fifteen blue discs and six red discs, and two discs were taken at random, it can be seen that the probability of taking two blue discs, P(BB) = (15/21)(14/20) = 1/2.

The next such arrangement, for which there is exactly 50% chance of taking two blue discs at random, is a box containing eighty-five blue discs and thirty-five red discs.

By finding the first arrangement to contain over 1012 = 1,000,000,000,000 discs in total, determine the number of blue discs that the box would contain.

=end

require 'pp'

last_discs = nil
discs      = 2
N = 1_000_000_000_000

while true
  b_start = ((( discs ** 2 - discs ) / 2 ) ** 0.5 ).to_i

  (b_start..discs).each do |blue|
    ls = discs * ( discs - 1 )
    rs = 2 * blue * ( blue - 1 )

    break if ls < rs

    if ls == rs
      puts "#{blue},#{discs}"

      exit if discs > N

      if last_discs
        temp = discs
        discs = ( discs * discs.to_f / last_discs ).to_i - 1

        last_discs = temp
      else
        last_discs = discs
      end

      break
    end
  end

  discs += 1
end
