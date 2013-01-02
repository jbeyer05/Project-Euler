
require 'pp'

$debug = true

def finished?( board )
  board.each do |row|
    row.each do |square|
      if square.length > 1
        return false
      end
    end
  end

  return true
end

def refine_board( board, thorough = true )
  pass     = 0
  progress = true

  while progress
    pass += 1
    progress = nil

    (0..8).each do |row|
      (0..8).each do |col|
        if board[row][col].length == 1
          num = board[row][col][0]

          # scan horizontally
          (0..8).each do |_col|
            next if _col == col
            if board[row][_col].include?( num )
              progress = true
              board[row][_col].delete( num )
            end
          end

          # scan vertically
          (0..8).each do |_row|
            next if _row == row
            if board[_row][col].include?( num )
              progress = true
              board[_row][col].delete( num )
            end
          end
        end
      end
    end

    (1..9).each do |num|
      # scan horizontally
      (0..8).each do |row|
        cnt = 0

        (0..8).each do |col|
          cnt += 1 if board[row][col].include?( num )
        end

        if cnt == 1
          (0..8).each do |col|
            if board[row][col].include?( num ) && board[row][col].length > 1
              board[row][col] = [num]
              progress = true
            end
          end
        end
      end

      # scan vertically
      (0..8).each do |col|
        cnt = 0

        (0..8).each do |row|
          cnt += 1 if board[row][col].include?( num )
        end

        if cnt == 1
          (0..8).each do |row|
            if board[row][col].include?( num ) && board[row][col].length > 1
              board[row][col] = [num]
              progress = true
            end
          end
        end
      end
    end

    if thorough
      (0..8).each do |row|
        (0..8).each do |col|
          if board[row][col].length == 1
            num = board[row][col][0]

            (row/3*3..row/3*3+2).each do |r|
              (col/3*3..col/3*3+2).each do |c|
                if ! ( row == r && col == c )
                  if board[r][c].include?( num )
                    board[r][c] -= board[row][col]
                    progress = true
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end

def legal?( board )
  return nil if ! board

  (0..8).each do |row|
    nums_found = []

    (0..8).each do |col|
      nums_found << board[row][col]
    end

    return nil if nums_found.uniq.length != 9
  end

  (0..8).each do |col|
    nums_found = []

    (0..8).each do |row|
      nums_found << board[row][col]
    end

    return nil if nums_found.uniq.length != 9
  end

  nums_found = []
  nums_found << board[0][0] << board[0][1] << board[0][2]
  nums_found << board[1][0] << board[1][1] << board[1][2]
  nums_found << board[2][0] << board[2][1] << board[2][2]
  return nil if nums_found.flatten.uniq.length != 9

  nums_found = []
  nums_found << board[3][0] << board[3][1] << board[3][2]
  nums_found << board[4][0] << board[4][1] << board[4][2]
  nums_found << board[5][0] << board[5][1] << board[5][2]
  return nil if nums_found.flatten.uniq.length != 9

  nums_found = []
  nums_found << board[6][0] << board[6][1] << board[6][2]
  nums_found << board[7][0] << board[7][1] << board[7][2]
  nums_found << board[8][0] << board[8][1] << board[8][2]
  return nil if nums_found.flatten.uniq.length != 9

  nums_found = []
  nums_found << board[0][3] << board[0][4] << board[0][5]
  nums_found << board[1][3] << board[1][4] << board[1][5]
  nums_found << board[2][3] << board[2][4] << board[2][5]
  return nil if nums_found.flatten.uniq.length != 9

  nums_found = []
  nums_found << board[3][3] << board[3][4] << board[3][5]
  nums_found << board[4][3] << board[4][4] << board[4][5]
  nums_found << board[5][3] << board[5][4] << board[5][5]
  return nil if nums_found.flatten.uniq.length != 9

  nums_found = []
  nums_found << board[6][3] << board[6][4] << board[6][5]
  nums_found << board[7][3] << board[7][4] << board[7][5]
  nums_found << board[8][3] << board[8][4] << board[8][5]
  return nil if nums_found.flatten.uniq.length != 9

  nums_found = []
  nums_found << board[0][6] << board[0][7] << board[0][8]
  nums_found << board[1][6] << board[1][7] << board[1][8]
  nums_found << board[2][6] << board[2][7] << board[2][8]
  return nil if nums_found.flatten.uniq.length != 9

  nums_found = []
  nums_found << board[3][6] << board[3][7] << board[3][8]
  nums_found << board[4][6] << board[4][7] << board[4][8]
  nums_found << board[5][6] << board[5][7] << board[5][8]
  return nil if nums_found.flatten.uniq.length != 9

  nums_found = []
  nums_found << board[6][6] << board[6][7] << board[6][8]
  nums_found << board[7][6] << board[7][7] << board[7][8]
  nums_found << board[8][6] << board[8][7] << board[8][8]
  return nil if nums_found.flatten.uniq.length != 9

  true
end

def board_dup( board )
  temp = []

  (0..8).each do |row|
    temp[row] = []

    (0..8).each do |col|
      temp[row][col] = board[row][col].clone
    end
  end

  temp
end

def recurse( board, depth = 0 )
  (0..8).each do |row|
    (0..8).each do |col|
      if board[row][col].length > 1
        board[row][col].each do |possible_num|
          _board = board_dup( board )

          _board[row][col] = [possible_num]

          refine_board( _board )

          if ! finished?( _board )
            _board = recurse( _board, depth + 1 )
          end

          if legal?( _board )
            return _board
          end
        end

        return nil
      end
    end
  end

  nil
end

lines = File.readlines( '0096/sudoku.txt' )

sum = 0

while lines.length > 0
  board = Array.new( 9, [] )

#  cur_lines = lines.pop( 10 )[1..-1]
  cur_lines = lines[1..9]
  lines = lines[10..-1]
  (0..8).each do |row|
    board[row] = cur_lines[row].chomp.split( // ).map { |i| i.to_i }
  end

  pp board
  puts

  board.map! do |row|
    row.map do |square|
      if square == 0
        (1..9).to_a
      else
        [square]
      end
    end
  end

  refine_board( board )

  if ! finished?( board )
    board = recurse( board )
  end

  pp board

  arr = board[0].flatten[0,3].map do |i|
    i.to_s
  end
  sum += arr.join( '' ).to_i

  puts "\n\n\n\n"
end

puts sum
