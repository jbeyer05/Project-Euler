
LENGTHS =
{
  0  => 0,
  1  => 3, 2  => 3, 3  => 5, 4  => 4, 5  => 4, 6  => 3, 7  => 5, 8  => 5, 9  => 4, 10 => 3,
  11 => 6, 12 => 6, 13 => 8, 14 => 8, 15 => 7, 16 => 7, 17 => 9, 18 => 8, 19 => 8, 20 => 6,
  30 => 6, 40 => 5, 50 => 5, 60 => 5, 70 => 7, 80 => 6, 90 => 6, 1000 => 11,
}

STR =
{
  0 => '',
  1 => 'one', 2 => 'two', 3 => 'three', 4 => 'four', 5 => 'five', 6 => 'six', 7 => 'seven', 8 => 'eight', 9 => 'nine', 10 => 'ten',
  11 => 'eleven', 12 => 'twelve', 13 => 'thirteen', 14 => 'fourteen', 15 => 'fifteen', 16 => 'sixteen', 17 => 'seventeen', 18 => 'eighteen', 19 => 'nineteen', 20 => 'twenty',
  30 => 'thirty', 40 => 'forty', 50 => 'fifty', 60 => 'sixty', 70 => 'seventy', 80 => 'eighty', 90 => 'ninety', 1000 => 'one thousand'
}

sum = 0

def length( i )
  return LENGTHS[i] if LENGTHS[i]

  if i >= 100 && ( i - i / 100 * 100 == 0 )
    # 100 200 300 ... 900
    return LENGTHS[i/100] + 7
  elsif i >= 100
    # 101 102 103 ... 999
    return LENGTHS[i/100] + 7 + 3 + length( i - ( i / 100 * 100 ))
  else
    # 21 22 23 24 ... 99
    return LENGTHS[i/10*10] + length( i - ( i / 10 * 10 ))
  end
end

(1..1000).each do |i|
  len = length( i )
  sum += len
end

puts sum
