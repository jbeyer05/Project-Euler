require 'pp'

fibs   = [1,1]
fibs_s = [1,1]

while fibs.length < 10000
  fibs   << fibs[-1] + fibs[-2]
  fibs_s << fibs_s[-1] + fibs_s[-2]

  a = fibs_s[-1].to_s
  b = fibs_s[-2].to_s

  fibs_s[-1] = a[0,19].to_i

  if a.length > b.length
    fibs_s[-2] = fibs_s[-2].to_s[0,18].to_i
  end

=begin
  if fibs_s[-1].to_s.length == fibs_s[-2].to_s.length
    fibs_s << ( fibs_s[-1] + fibs_s[-2] ).to_s[0,12].to_i
  else
    fibs_s << ( fibs_s[-1] * 10 + fibs_s[-2] ).to_s[0,12].to_i
  end
=end
end

fibs.each_index do |i|
  a = fibs[i].to_s[0,10]
  b = fibs_s[i].to_s[0,10]

  pp [i,a,b,fibs[i],fibs[i-1],fibs[i-2],fibs_s[i-1],fibs_s[i-2]] if a != b
end
