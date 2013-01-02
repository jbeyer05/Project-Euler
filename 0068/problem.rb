require 'pp'

max_r = '0'

[10,9,8,7,6,5,4,3,2,1].permutation.each do |r|
  next if r[3] < r[0] || r[5] < r[0] || r[7] < r[0] || r[9] < r[0]

  row0 = r[0] + r[1] + r[2]
  row1 = r[3] + r[2] + r[4]
  row2 = r[5] + r[4] + r[6]
  row3 = r[7] + r[6] + r[8]
  row4 = r[9] + r[8] + r[1]

  if row0 == row1 && row1 == row2 && row2 == row3 && row3 == row4
    r_str = [r[0],r[1],r[2],r[3],r[2],r[4],r[5],r[4],r[6],r[7],r[6],r[8],r[9],r[8],r[1]].join( '' )
    puts r_str if r_str.length == 16

    if r_str.length == 16 && r_str > max_r
      max_r = r_str
    end
  end
end

puts max_r
