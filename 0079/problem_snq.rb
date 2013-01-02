require 'pp'

attempts = File.readlines( '0079/keylog.txt' ).map { |k| k.chomp }
attempts = attempts
puts "#{attempts.length} attempts before"
attempts.uniq!
puts "#{attempts.length} attempts after"

pp attempts


s = attempts[0]

attempts.each do |att|
  if s[0] == att[2]
    s = att + s[1..-1]
  elsif s[s.length-1] == att[0]
    s += att[0,2]
  elsif s[0,2] == att[1..-1]
    s = att[0] + s
  elsif s[-2..-1] == att[0,2]
    s += att[2]
  else
    s.sub!( att[0] + att[2], att )
  end
end

puts s
