require 'pp'

# high card       = 0
# one pair        = 1
# two pair        = 2
# three of a kind = 3
# straight        = 4
# flush           = 5
# full house      = 6
# four of a kind  = 7
# straight flush  = 8
# royal flush     = 9

CARD_TO_NO = {
  '2' => 2,
  '3' => 3,
  '4' => 4,
  '5' => 5,
  '6' => 6,
  '7' => 7,
  '8' => 8,
  '9' => 9,
  'T' => 10,
  'J' => 11,
  'Q' => 12,
  'K' => 13,
  'A' => 14
}


def flush( hand )
  suits = {}

  hand.each do |card|
    if suits[card[1]]
      suits[card[1]] += 1
    else
      suits[card[1]] = 1
    end
  end

  ( suits['H'] == 5 || suits['C'] == 5 || suits['S'] == 5 || suits['D'] == 5 )
end

def straight( hand )
  ranks = []

  hand.each do |card|
    if card[0] == 'A'
      ranks << 1
      ranks << 14
    else
      ranks << CARD_TO_NO[card[0]]
    end
  end

  ranks.uniq!
  ranks.sort!

  if ranks.length < 5
    return nil
  elsif ranks.length == 5
    if ranks.last - ranks.first == 4
      return true
    else
      return nil
    end
  else
    if ranks[-2] - ranks.first == 4
      return true
    elsif ranks.last - ranks[1] == 4
      return true
    else
      return nil
    end
  end
end

def four_of_a_kind( hand )
  count = {}

  hand.each do |card|
    if card[0] == 'A'
      if count[14]
        count[14] += 1
      else
        count[14]  = 1
      end
    else
      if count[CARD_TO_NO[card[0]]]
        count[CARD_TO_NO[card[0]]] += 1
      else
        count[CARD_TO_NO[card[0]]]  = 1
      end
    end
  end

  count.each_pair do |card,count|
    if count == 4
      return card
    end
  end

  nil
end

def full_house( hand )
  count = {}

  hand.each do |card|
    if card[0] == 'A'
      if count[14]
        count[14] += 1
      else
        count[14]  = 1
      end
    else
      if count[CARD_TO_NO[card[0]]]
        count[CARD_TO_NO[card[0]]] += 1
      else
        count[CARD_TO_NO[card[0]]]  = 1
      end
    end
  end

  three_pair = nil
  two_pair   = nil

  count.each_pair do |card,count|
    if count == 3
      three_pair == card
    elsif count == 2
      two_pair   == card
    end
  end

  if three_pair && two_pair
    three_pair
  else
    nil
  end
end

def one_pair( hand )
  count = {}

  hand.each do |card|
    if card[0] == 'A'
      if count['A']
        return 14
      else
        count['A'] = 1
      end
    else
      if count[CARD_TO_NO[card[0]]]
        return CARD_TO_NO[card[0]]
      else
        count[CARD_TO_NO[card[0]]] = 1
      end
    end
  end

  nil
end

def two_pair( hand )
  count = {}

  hand.each do |card|
    if card[0] == 'A'
      if count[14]
        count[14] += 1
      else
        count[14]  = 1
      end
    else
      if count[CARD_TO_NO[card[0]]]
        count[CARD_TO_NO[card[0]]] += 1
      else
        count[CARD_TO_NO[card[0]]]  = 1
      end
    end
  end

  first_pair = nil

  count.each_pair do |card,count|
    if count == 2 && first_pair
      return (( card > first_pair ) ? card : first_pair )
    elsif count == 2
      first_pair = card
    end
  end

  nil
end

def three_kind( hand )
  count = {}

  hand.each do |card|
    if card[0] == 'A'
      if count[14]
        count[14] += 1
      else
        count[14]  = 1
      end
    else
      if count[CARD_TO_NO[card[0]]]
        count[CARD_TO_NO[card[0]]] += 1
      else
        count[CARD_TO_NO[card[0]]]  = 1
      end
    end
  end

  count.each_pair do |card,count|
    if count == 3
      return card
    end
  end

  nil
end

def high_card( hand )
  ranks = []

  hand.each do |card|
    if card[0] == 'A'
      ranks << 14
    else
      ranks << CARD_TO_NO[card[0]]
    end
  end

  ranks.sort.last
end

def low_card( hand )
  ranks = []

  hand.each do |card|
    if card[0] == 'A'
      ranks << 1
    else
      ranks << CARD_TO_NO[card[0]]
    end
  end

  ranks.sort.first
end

def value_of_hand( hand )
  high_card = high_card( hand )
  low_card  = low_card( hand )
  print "HAND #{hand.join( ' ' )} is "

  if flush( hand )
    if straight( hand )
      if low_card == 10
        puts "a royal flush"
        return [9, high_card]
      else
        puts "a straight flush"
        return [8, high_card]
      end
    end
  end

  if( four_of_a_kind( hand ))
    puts "four of a kind"
    return [7, four_of_a_kind( hand )]
  elsif( full_house( hand ))
    puts "a full house"
    return [6, full_house( hand )]
  elsif( flush( hand ))
    puts "a flush"
    return [5, high_card]
  elsif( straight( hand ))
    puts "a straight"
    return [4, high_card( hand )]
  elsif( three_kind( hand ))
    puts "three of a kind"
    return [3, three_kind( hand )]
  elsif( two_pair( hand ))
    puts "two pair"
    return [2, two_pair( hand )]
  elsif( one_pair( hand ))
    puts "one pair"
    return [1, one_pair( hand )]
  else
    puts "high card"
    return [0, high_card( hand )]
  end
end


count = 0

File.readlines( '0054/poker.txt' ).each do |line|
  puts
  cards = line.split( ' ' )
  if (( value_of_hand( cards[0,5] ) <=> value_of_hand( cards[5,5] )) == 1 )
    count += 1
  end
end

puts "\n\nPLAYER 1 WON #{count} hands"
