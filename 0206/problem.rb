
start = (1020000000000000000**0.5-1).to_i
start -= ( start % 10 )
stop  = (1930000000000000000**0.5+1).to_i

puts "GOING FROM #{ start } TO #{ stop } = #{ stop - start }"
puts "GOING FROM #{ start * start } TO #{ stop * stop }"

start.step( stop, 10 ).each do |i|
  str = ( i * i ).to_s

  if str[18] == '0'[0] &&
     str[16] == '9'[0] && 
     str[14] == '8'[0] && 
     str[12] == '7'[0] && 
     str[10] == '6'[0] && 
     str[8]  == '5'[0] && 
     str[6]  == '4'[0] && 
     str[4]  == '3'[0] && 
     str[2]  == '2'[0] && 
     str[0]  == '1'[0]
    puts i * i
    puts i
  end
end
