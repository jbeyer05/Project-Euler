#!/usr/bin/env ruby1.9

require 'pp'

DIGITS = 100

gross_sum = 0

(1..100).each do |i|
  next if ( i ** 0.5 ).to_i ** 2 == i

  num = 0

  (0..DIGITS).each do |digit_place|
    (0..9).each do |digit|
      _num = num + digit * 10 ** ( DIGITS - digit_place )

#      puts "#{_num} : COMPARING #{_num*_num}"
      if _num * _num > i * 10 ** ( DIGITS * 2 )
        num += ( digit - 1 ) * 10 ** ( DIGITS - digit_place )
        break
      elsif digit == 9
        num += digit * 10 ** ( DIGITS - digit_place )
      end
    end
  end

  sum = 0
  num.to_s.split( '' )[0..-2].each do |s|
    sum += s.to_i
  end

  gross_sum += sum

#  puts "sum is #{sum} for #{i}"
#  puts "num is #{num} for #{i}"
end

puts gross_sum
