require 'mathn'

sum = Prime.new.inject(0) { |sum, n|
  break sum unless n < 1_000_000
  sum + n
}

puts sum
