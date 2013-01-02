require 'pp'

chain_length = { 1 => 1 }

(2..999999).each do |i|
  len = 0
  _i  = i

  while ! chain_length[i]
    len += 1
    if i % 2 == 0
      i /= 2
    else
      i = 3 * i + 1
    end
  end

  chain_length[_i] = len + chain_length[i]
end

longest_chain_len = 1
longest_chain = 1

chain_length.each_pair do |k,v|
  if v > longest_chain_len
    longest_chain = k
    longest_chain_len = v
  end
end

puts longest_chain
puts longest_chain_len


