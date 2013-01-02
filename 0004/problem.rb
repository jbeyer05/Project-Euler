
def palindrome?( i )
  i.to_s == i.to_s.reverse
end

palindromes = []

(100..999).each do |i|
  (100..999).each do |j|
    if palindrome?( i * j )
      palindromes << i * j
    end
  end
end

puts palindromes.sort.last
