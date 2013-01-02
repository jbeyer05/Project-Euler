require 'pp'

attempts = File.readlines( '0079/keylog.txt' ).map { |k| k.to_i.to_s }
attempts = attempts[0,7]
puts "#{attempts.length} attempts before"
attempts.uniq!
puts "#{attempts.length} attempts after"

$reg_exps = {}
attempts.each do |a|
  $reg_exps[a]      = /.*#{a[0,1]}.*#{a[1,1]}.*#{a[2,1]}/
  $reg_exps[a[0,2]] = /.*#{a[0,1]}.*#{a[1,1]}/
  $reg_exps[a[1,2]] = /.*#{a[1,1]}.*#{a[2,1]}/
end


passcodes = [attempts[0]]

def print_ret( ret, depth )
  ret.each do |p|
    puts ( ' ' * depth ) + "RETURNING #{p}"
  end
end

def expand_passcode( passcode, a, depth )
#  puts ( ' ' * depth ) + "EXPANDING #{passcode} with #{a}"
  ret = []

  if a.length == 1
    if passcode.index( a )
      return [passcode]
    else
      (0..passcode.length).each do |i|
        ret << passcode[0,i] + a + passcode[i..-1]
      end

#      print_ret( ret, depth )
      return ret
    end
  end

  if passcode.index( a[0,1] )
    start = passcode.index( a[0,1] )
    rear_possibilities = expand_passcode( passcode[start+1..-1], a[1..-1], depth + 1 )

    rear_possibilities.map! do |rear_possibility|
      passcode[0..start] + rear_possibility
    end

#    print_ret( rear_possibilities.flatten, depth )
    return rear_possibilities.flatten
  else
    passcodes = []
    (0..passcode.length).each do |i|
      temp = passcode[0,i] + a[0,1]

      expand_passcode( passcode[i..-1], a[1..-1], depth + 1 ).map do |p|
        passcodes << temp + p
      end
    end

#    print_ret( passcodes.flatten, depth )
    return passcodes.flatten
  end
end

count = 0
attempts.each_index do |i|
  # first attempt forms passcodes starting array
  next if i == 0

  a = attempts[i]
  new_passcodes = []

  min_length = 10**10
  passcodes.each do |p|
    if p.length < min_length
      min_length = p.length
    end
  end

  passcodes.each do |passcode|
    if passcode.length <= min_length + 3 * ( attempts.length - i )
      if $reg_exps[a].match( passcode )
        count += 1
        new_passcodes << passcode
      else
        new_passcodes << expand_passcode( passcode, a, 0 )
      end
#    else
#      puts "BOOTING HERE, passcode.length = #{passcode.length} is much longer than #{min_length} with #{attempts.length - i} attempts left"
    end
  end

  passcodes = new_passcodes.flatten
end

min_length = 10**10
min_p = 0
lengths = {}

passcodes.each do |p|
  if ! lengths[p.length]
    lengths[p.length] = 0
  else
    lengths[p.length] += 1
  end

  if p.length < min_length
    min_length = p.length
    min_p = p
  end
end

pp lengths

puts "SKIPPED #{count} times"
puts "#{passcodes.length} passcodes"
puts min_p
