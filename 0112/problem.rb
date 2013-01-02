
def bouncy?( n )
  n_chars      = n.to_s.split( // )
  n_chars_sort = n_chars.sort

  ! ( n_chars_sort == n_chars || n_chars_sort.reverse == n_chars )
end

count = 0
i = 2

while 100 * count / ( i - 1 ) < 99
  if bouncy?( i )
    count += 1
  end

  i += 1
end

puts i - 1
