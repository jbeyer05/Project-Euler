require 'pp'

EXAMINE_FIRST_N_ATTEMPTS = 9
DIGITS = 8

attempts = File.readlines( '0079/keylog.txt' ).map { |k| k.to_i.to_s }[0,EXAMINE_FIRST_N_ATTEMPTS]

attempts.map! do |a|
  /.*#{a[0,1]}.*#{a[1,1]}.*#{a[2,1]}/
end


('0'*DIGITS..'9'*DIGITS).each do |i|
  match = true

  attempts.each do |a|
    if ! a.match( i )
      match = false
      break
    end
  end

  if match
    puts i
    exit
  end
end
