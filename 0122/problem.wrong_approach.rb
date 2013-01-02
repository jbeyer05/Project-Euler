
N = 200

$m = { 1 => 0 }

def m( n )
  if $m[n]
    $m[n]
  else
#    puts "in m( #{n} ), exploring m( 1 ) and m( #{ n - 1 })"
    lowest_mults = m( 1 ) + m( n - 1 )

    (2..n/2).each do |i|
#      puts "in m( #{n} ), exploring m( #{ i } ) and m( #{ n - i })"
      if m( i ) + m( n - i ) < lowest_mults
        lowest_mults = m( i ) + m( n - i )
      end
    end

    $m[ n ] = lowest_mults
#    puts "on m( #{n} ), returning #{lowest_mults}"
    lowest_mults
  end
end

(1..15).each do |n|
  puts "n : #{n} m( n ) : #{m( n )}"
end


=begin

           1
          /
         2
        /
       4
      /
     8
    /\ \  \
   16 12 10 11

=end
