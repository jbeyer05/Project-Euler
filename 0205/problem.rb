
N_PETER = 9
N_COLIN = 6

MAX_PETER = 4
MAX_COLIN = 6

$pete_probability = {}

def recurse( s )
  return $pete_probability[s] if $pete_probability[s]

  probability = 0

  if s[:p_rolls] > 0
    (1..MAX_PETER).each do |roll|
      probability += recurse( { :p_score => s[:p_score] + roll, :p_rolls => s[:p_rolls] - 1, :c_score => s[:c_score], :c_rolls => s[:c_rolls] } ) / MAX_PETER
    end

    $pete_probability[s] = probability
    return probability
  end

  if s[:c_rolls] > 0
    (1..MAX_COLIN).each do |roll|
      probability += recurse( { :p_score => s[:p_score], :p_rolls => s[:p_rolls], :c_score => s[:c_score] + roll, :c_rolls => s[:c_rolls] - 1 } ) / MAX_COLIN
    end

    $pete_probability[s] = probability
    return probability
  end

  if s[:p_score] > s[:c_score]
    $pete_probability[s] = 1.0
    return 1.0
  else
    $pete_probability[s] = 0.0
    return 0.0
  end
end


puts recurse( { :p_score => 0, :p_rolls => N_PETER, :c_score => 0, :c_rolls => N_COLIN } )



