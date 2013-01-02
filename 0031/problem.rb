
count = 0

(0..200).each do |p1|
  (0..40).each do |p5|
    p5sum = p1 + 5*p5
    next if p5sum % 2 != 0

    (0..100).each do |p2|
      p2sum = p5sum + 2*p2
      next if( p2sum > 200 )

      (0..20).each do |p10|
        p10sum = p2sum + 10*p10
        next if p10sum > 200

        (0..10).each do |p20|
          p20sum = p10sum + 20*p20
          next if( p20sum > 200 )

          (0..4).each do |p50|
            p50sum = p20sum + 50*p50
            next if( p50sum > 200 )

            (0..2).each do |p100|
              (0..1).each do |p200|
                count += 1 if( p10sum + 20*p20 + 50*p50 + 100*p100 + 200*p200 == 200 )
              end
            end
          end
        end
      end
    end
  end
end

puts count
