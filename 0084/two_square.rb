require 'pp'

N = 1000
SPACES = 5

prob = Array.new( SPACES, 0.0 )
prob[0] = 1.0

roll_prob =
[
  [0,0.5],
  [1,0.5],
]

(1..N).each do |n|
  pp prob

  next_prob = Array.new( SPACES, 0.0 )

  roll_prob.each do |roll|
    (0..(SPACES-1)).each do |space|
      next_prob[(space+roll[0])%SPACES] += prob[space] * roll[1]
    end

  end

  prob = next_prob
end
