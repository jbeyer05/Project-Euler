require 'pp'

N     = 100_000
ROLLS = 1_000
SIDES = 6

(1..N).each do |n|
  (1..ROLLS).each do |roll|
    roll1 = ( rand() * SIDES + 1 ).to_i
    roll2 = ( rand() * SIDES + 1 ).to_i

  end
end
