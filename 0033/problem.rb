
(10..99).each do |num|
  (num+1..99).each do |denom|
    (2..num).each do |new_denom|
      new_num = num / ( denom.to_f / new_denom )

      if new_num.to_i.to_f == new_num
        if denom.to_s[1,1] == new_denom.to_s && num.to_s[0,1] == new_num.to_i.to_s && denom.to_s[0,1] == num.to_s[1,1]
          puts "might work for #{num} / #{denom} -> #{new_num.to_i} / #{new_denom}"
        end
      end
    end
  end
end
