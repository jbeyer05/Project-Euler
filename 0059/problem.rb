require 'pp'

bytes = File.readlines( '0059/cipher1.txt' )[0].split( ',' ).map { |b| b.to_i }


('a'..'z').each do |a|
  ('a'..'z').each do |b|
    ('a'..'z').each do |c|
      new_string = ''

      bytes.each_index do |i|
        if i % 3 == 0
          new_string << ( bytes[i] ^ a[0] )
        elsif i % 3 == 1
          new_string << ( bytes[i] ^ b[0] )
        elsif i % 3 == 2
          new_string << ( bytes[i] ^ c[0] )
        end
      end

      if new_string['the'] && new_string['and'] && new_string['. ']
        puts "\n#{a} #{b} #{c}"
        puts new_string
      end

      if a == 'g' && b == 'o' && c == 'd'
        sum = 0

        new_string.each_byte do |b|
          sum += b
        end

        puts sum
      end
    end
  end
end

