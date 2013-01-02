require 'pp'


VERBOSE = nil

prob = Array.new( 40, 0.0 )
prob[0] = 1.0
ROLLS = 1_000

SIDES = 4

roll_probs =
{
  4 =>
[
  [2,1/16.0],
  [3,2/16.0],
  [4,3/16.0],
  [5,4/16.0],
  [6,3/16.0],
  [7,2/16.0],
  [8,1/16.0],
],
  6 =>
[
  [2,1/36.0],
  [3,2/36.0],
  [4,3/36.0],
  [5,4/36.0],
  [6,5/36.0],
  [7,6/36.0],
  [8,5/36.0],
  [9,4/36.0],
  [10,3/36.0],
  [11,2/36.0],
  [12,1/36.0]
]
}

roll_prob = roll_probs[SIDES]

CC = [ 2, 17, 33 ]
CH = [ 7, 22, 36 ]

double_rolls = 0

(1..ROLLS).each do |roll_n|
  if VERBOSE || roll_n % 10 == 0
    (0..39).each do |i|
      printf( "%6d ", i )
    end
    puts

    prob.each do |p|
      printf( "%.4f ", p )
    end
    puts
    puts "#{roll_n}: #{prob.sum}"

    prob_hash = {}
    (0..39).each do |i|
      prob_hash[i] = prob[i]
    end

    pp ( prob_hash.to_a.sort { |a,b| a[1] <=> b[1] })[-10..-1]
  end

  next_prob = Array.new( 40, 0.0 )

  next_prob[10] += 1 / 216.0

  roll_prob.each do |roll|
    (0..39).each do |_space|
      already_added_prob = nil

      space = _space + roll[0]

      space = space % 40

      prior = roll[1] * prob[_space] * 215 / 216.0

      if CC.index( space )
        already_added_prob = true
        next_prob[0]     += prior * 1  / 16.0
        next_prob[10]    += prior * 1  / 16.0
        next_prob[space] += prior * 14 / 16.0

=begin
        case ( rand( ) * 16 + 1 ).to_i
        when 1
          space = 0
        when 2
          space = 10
        end
=end
      elsif CH.index( space )
        already_added_prob = true
        next_prob[0]       += prior * 1  / 16.0
        next_prob[10]      += prior * 1  / 16.0
        next_prob[11]      += prior * 1  / 16.0
        next_prob[24]      += prior * 1  / 16.0
        next_prob[39]      += prior * 1  / 16.0
        next_prob[5]       += prior * 1  / 16.0
        next_prob[space-3] += prior * 1  / 16.0
        next_prob[space]   += prior * 6  / 16.0

        if space == 7
          next_prob[15]    += prior * 2  / 16.0
          next_prob[12]    += prior * 1  / 16.0
        elsif space == 22
          next_prob[25]    += prior * 2  / 16.0
          next_prob[28]    += prior * 1  / 16.0
        elsif space == 36
          next_prob[5]     += prior * 2  / 16.0
          next_prob[12]    += prior * 1  / 16.0
        end

=begin
        case ( rand( ) * 16 + 1 ).to_i
        when 1
          space = 0
        when 2
          space = 10
        when 3
          space = 11
        when 4
          space = 24
        when 5
          space = 39
        when 6
          space = 5
        when 7
        when 8
          if space == 7
            space = 15
          elsif space == 22
            space = 25
          elsif space == 36
            space = 5
          end
        when 9
          if space == 7
            space = 12
          elsif space == 22
            space = 28
          elsif space == 36
            space = 12
          end
        when 10
          space -= 3
        end
=end
      elsif space == 30 # G2J
        space = 10
      end

      next_prob[space] += prior if ! already_added_prob
    end
  end

  prob = next_prob
end

sum = 0
prob.each do |p|
  sum += p
end

prob_hash = {}
(0..39).each do |i|
  prob_hash[i] = prob[i] / sum
end

pp ( prob_hash.to_a.sort { |a,b| a[1] <=> b[1] } )[-10..-1]
