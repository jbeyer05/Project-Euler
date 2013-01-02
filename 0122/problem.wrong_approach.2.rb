
N = 200

$m = { 1 => 0 }


(2..N).each do |n|
  (1..n).each do |i|
    (1..n).each do |j|
      if ! $m[ i + j ] || [ $m[i], $m[j]].max + 1 < $m[ i + j ]
        $m[ i + j ] = [ $m[i], $m[j]].max + 1
      end
    end
  end
end

sum = 0

(1..N).each do |n|
  sum += $m[n]
end

pp $m
puts sum

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
