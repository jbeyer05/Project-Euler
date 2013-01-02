
def bouncy?( n )
  n_chars      = n.to_s.split( // )
  n_chars_sort = n_chars.sort

#  ! ( n_chars_sort == n_chars || n_chars_sort.reverse == n_chars )
  ! ( n_chars_sort.reverse == n_chars )
#  ! ( n_chars_sort == n_chars )
end


count = 0

(1..999_999).each do |n|
  if ! bouncy?( n )
    count += 1
    puts n
  end
end

puts
puts count
