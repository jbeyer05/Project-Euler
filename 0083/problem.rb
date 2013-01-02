require 'pp'

matrix = File.readlines( '0083/matrix.txt' )
matrix.map! do |line|
  line.chomp.split( ',' ).map! do |num|
    num.to_i
  end
end


best_score = { [0,0] => matrix[0][0] }
best_path  = { [0,0] => '.' }

(1..( matrix.length - 1 )).each do |row|
  best_score[[row,0]] = best_score[[row-1,0]] + matrix[row][0]
  best_path[[row,0]]  = 'U'
end


(1..( matrix.length - 1 )).each do |col|
  (0..( matrix.length - 1 )).each do |row|
    best_score[[row,col]] = best_score[[row,col-1]] + matrix[row][col]
    best_path[[row,col]] = 'L' #[row,col-1]
  end
end

pass    = 1
changes = 1

while changes > 0
  changes = 0

  (0..( matrix.length - 1 )).each do |col|
    (0..( matrix.length - 1 )).each do |row|
      # check left
      if col != 0
        if best_score[[row,col-1]] + matrix[row][col] < best_score[[row,col]]
          best_score[[row,col]] = best_score[[row,col-1]] + matrix[row][col] 
          best_path[[row,col]]  = 'L'
          changes += 1
        end
      end

      # check up
      if row != 0
        if best_score[[row-1,col]] + matrix[row][col] < best_score[[row,col]]
          best_score[[row,col]] = best_score[[row-1,col]] + matrix[row][col] 
          best_path[[row,col]]  = 'U'
          changes += 1
        end
      end

      # check down
      if row != matrix.length - 1
        if best_score[[row+1,col]] + matrix[row][col] < best_score[[row,col]]
          best_score[[row,col]] = best_score[[row+1,col]] + matrix[row][col] 
          best_path[[row,col]]  = 'D'
          changes += 1
        end
      end

      # check right
      if col != matrix.length - 1
        if best_score[[row,col+1]] + matrix[row][col] < best_score[[row,col]]
          best_score[[row,col]] = best_score[[row,col+1]] + matrix[row][col] 
          best_path[[row,col]]  = 'R'
          changes += 1
        end
      end
    end
  end

  puts "#{changes} changes on pass #{pass}"
  pass   += 1
end

puts best_score[[matrix.length-1,matrix.length-1]]

(0..( matrix.length - 1 )).each do |row|
  (0..( matrix.length - 1 )).each do |col|
    print best_score[[row,col]].to_s + ','
  end

  puts
end

(0..( matrix.length - 1 )).each do |row|
  (0..( matrix.length - 1 )).each do |col|
    print best_path[[row,col]].to_s
  end

  puts
end


#pp best_score
#pp best_path
