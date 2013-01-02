require 'pp'

$count_sorted_digits = {}
n = 1

while true
  digits = ( n ** 3 ).to_s.split( // ).sort
  if $count_sorted_digits[digits]
    $count_sorted_digits[digits] << n ** 3

    if $count_sorted_digits[digits].length == 5
      puts n
      pp $count_sorted_digits[digits]
      exit
    end
  else
    $count_sorted_digits[digits] = [n ** 3]
  end

  n += 1
end
