require 'pp'

N     = 50
count = 0

def evaluate_expansion( digits )
  sum   = 0

  digits.reverse.each do |d|
    sum = 1.to_f / ( d + sum )
  end

#  puts "eval for #{digits} is #{1 / sum}"
  1 / sum
end

def cycle?( digits )
  (1..digits.length/2).each do |l|
    if digits[ -1 * l, l ] == digits[ -2 * l, l ]
      return l
    end
  end

  nil
end

def recurse( digits, n )
  if cycle?( digits )
    puts "FOUND CYCLE FOR #{n}"
    pp digits
    return cycle?( digits )
  end

  new_digit = nil

  if digits.length % 2 == 1
    9.downto( 0 ).each do |d|
      temp = evaluate_expansion( digits + [d] )
      if temp * temp > n
        new_digit = d
        break
      end
    end
  else
    (0..9).each do |d|
      temp = evaluate_expansion( digits + [d] )
      if temp * temp > n
        new_digit = d - 1
        break
      end
    end
    new_digit = 9 if new_digit == nil
  end

  recurse( digits + [new_digit], n )
end

def period( n )
  digits = []
  o = n

  recurse( [ ( n ** 0.5 ).to_i ], n )
end

(2..N).each do |n|
  next if ( n ** 0.5 ).to_i == ( n ** 0.5 )
  p = period( n )
  puts "PERIOD FOR #{n} is #{p}"

  if p % 2 == 1
    count += 1
  end
end

puts count
