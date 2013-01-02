require 'pp'

N = 300_000_000_000_000

=begin
$a_to_i = []

%w( 0 1 2 3 4 5 6 7 8 9 ).each do |d|
  $a_to_i[d.ord] = d.to_i
end
=end

def sum_digits( i )
  sum = 0

  i.to_s.split( // ).each do |d|
    sum += d.to_i
#    sum += $a_to_i[d.ord]
  end

  sum
end


$special = []

(2..(N**0.51).to_i).each do |base|
  exp = 2

  while base ** exp < N
    if sum_digits( base ** exp ) == base
      $special << base ** exp
    end

    exp += 1
  end
end

pp $special.sort
puts $special.length
