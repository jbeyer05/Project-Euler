require 'pp'

attempts = File.readlines( '0079/keylog.txt' ).map { |k| k.chomp.split( // ) }
attempts = attempts
puts "#{attempts.length} attempts before"
attempts.uniq!
puts "#{attempts.length} attempts after"

pp attempts
pp attempts.flatten.uniq

( '00000000'..( 99_999_999.to_s )).each do |passcode|
  next if passcode['4'] || passcode['5']
  next if ! ( passcode['0'] && passcode['1'] && passcode['2'] && passcode['3'] && passcode['6'] && passcode['7'] && passcode['8'] && passcode['9'] )
  correct = true

=begin
  idx = passcode.length - 1
  attempts_idx = Array.new( attempts.length, 2 )

  while idx >= 0
    attempts.each_with_index do |attempt,i|
      if attempts_idx[i] >= 0 && passcode[idx] == attempt[attempts_idx[i]]
        attempts_idx[i] -= 1
      end
    end

    idx -= 1
  end

  attempts_idx.each do |idx|
    if idx >= 0
      correct = nil
      break
    end
  end
=end

  attempts.each do |attempt|
    a_idx = attempt.length - 1
    idx   = passcode.length - 1
    while idx >= 0 && a_idx >= 0
      if passcode[idx] == attempt[a_idx]
        a_idx -= 1
      end

      idx -= 1
    end

    if a_idx >= 0
      correct = nil
      break
    end
  end

  if correct
    puts "HERE"
    puts passcode
    exit
  end
end


