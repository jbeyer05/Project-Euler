require 'pp'

N     = 300_000
ROLLS = 100
SIDES = 4

CC = [ 2, 17, 33 ]
CH = [ 7, 22, 36 ]

space = 0
landings = {}
landings.default = 0

double_rolls = 0

(1..N).each do |n|
  (1..ROLLS).each do |roll|
    roll1 = ( rand() * SIDES + 1 ).to_i
    roll2 = ( rand() * SIDES + 1 ).to_i

    if roll1 == roll2
      double_rolls += 1
    else
      double_rolls = 0
    end

    if double_rolls == 3
      space = 10
    else
      space += roll1 + roll2
    end

    space = space % 39

    if CC.index( space )
      case ( rand( ) * 16 + 1 ).to_i
      when 1
        space = 0
      when 2
        space = 10
      end
    elsif CH.index( space )
      case ( rand( ) * 16 + 1 ).to_i
      when 1
        space = 0
      when 2
        space = 10
      when 3
        space = 12
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
    elsif space == 30 # G2J
      space = 10
    end
  end

#  puts space
  landings[space] += 1
end

landings.each_key do |key|
  landings[key] /= N.to_f
end

pp landings.to_a.sort { |a,b| a[1] <=> b[1] }
