
max_c_length   = 0
d_max_c_length = 0

(2..999).each do |divisor|
  pos = 1
  dividend = 10
  dividends_seen = { }

  while dividend % divisor != 0 && ! dividends_seen[dividend]
    dividends_seen[dividend] = pos
    dividend = 10 * ( dividend % divisor )
    pos += 1
  end

  if dividends_seen[dividend] && ( pos - dividends_seen[dividend] > max_c_length )
    d_max_c_length = divisor
    max_c_length   = pos - dividends_seen[dividend]
  end
end

puts "#{d_max_c_length} had a cycle #{max_c_length} long"
