
n = 0

def digits( i )
  ret = {}

  i.to_s.each_char do |c|
    if ret[c]
      ret[c] += 1
    else
      ret[c] = 0
    end
  end

  ret
end

while true
  n += 1
#  next if n.to_s[0] >= '2'[0]
#  puts "TESTING #{n}"

  if digits( n ) == digits( 2*n ) &&
     digits( n ) == digits( 3*n ) &&
     digits( n ) == digits( 4*n ) &&
     digits( n ) == digits( 5*n ) &&
     digits( n ) == digits( 6*n )
    puts n
    exit
  end
end
