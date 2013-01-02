require 'pp'

puts "ANSWER IS BOTH HERE AND IN explore_fib2.rb"
N = 9

def slow_f_pandigital?( str )
  str[0,9].split( // ).sort.join == '123456789'
end

def slow_r_pandigital?( str )
  return false if str.length < 9
  str[-9,9].split( // ).sort.join == '123456789'
end

def f_pandigital?( str )
  count  = []

  (0..N-1).each do |i|
    if count[str[i]] || str[i,1] == '0'
      return false
    else
      count[str[i]] = true
    end
  end

  true
end

def r_pandigital?( str )
  count = []

  (str.length-N..str.length-1).each do |i|
    if count[str[i]] || str[i,1] == '0'
      return false
    else
      count[str[i]] = true
    end
  end

  true
end

fibs  = [1,1]
count = 2

rfibs = fibs.clone

fib_str  = fibs.last.to_s
rfib_str = rfibs.last.to_s

while true
  f = slow_f_pandigital?( fib_str )
  r = slow_r_pandigital?( rfib_str )

#  pp [f,r,fib_str,rfib_str] if r || f

  if f && r
    puts fib_str
    puts rfib_str
    puts count
    puts
    exit
  end

  fibs  << fibs[-1] + fibs[-2]
  a = fibs[-1].to_s
  b = fibs[-2].to_s

  fibs[-1] = a[0,30].to_i

  if a.length > b.length
    fibs[-2] = fibs[-2].to_s[0,29].to_i
  end


  rfibs << ( rfibs[-1] + rfibs[-2] ) % 10**11
  count += 1

  if fibs.length > 100
    fibs  = fibs[-2,2]
    rfibs = rfibs[-2,2]
  end

  fib_str  = fibs.last.to_s
  rfib_str = rfibs.last.to_s
  puts "CHECKING #{count}th fib : #{fib_str} AND #{rfib_str}"  if count % 10000 == 0
end
