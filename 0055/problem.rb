
def lychrel?( n )
  i = 1

  while i <= 50
    i += 1
    n = n + n.to_s.reverse.to_i

    if n.to_s == n.to_s.reverse
      return false
    end
  end

  true
end

count = 0

(1..9999).each do |n|
  count += 1 if lychrel?( n )
end

puts count
