require 'pp'

matrix = File.readlines( '0082/matrix.txt' )
matrix.map! do |line|
  line.chomp.split( ',' ).map! do |num|
    num.to_i
  end
end


best_score = { }
best_path  = { }

(0..( matrix.length - 1 )).each do |i|
  best_score[[i,0]] = matrix[i][0]
end


(1..( matrix.length - 1 )).each do |col|
  (0..( matrix.length - 1 )).each do |row|
    best_score[[row,col]] = best_score[[row,col-1]] + matrix[row][col]
    best_path[[row,col]] = 'L' #[row,col-1]
  end

  changes = true

  while changes
    changes = nil

    (1..( matrix.length - 1 )).each do |row|
      if best_score[[row-1,col]] + matrix[row][col] < best_score[[row,col]]
        best_score[[row,col]] = best_score[[row-1,col]] + matrix[row][col]
        best_path[[row,col]] = 'U' #[row-1,col]
        changes = true
      end
    end

    (0..( matrix.length - 2 )).each do |row|
      if best_score[[row+1,col]] + matrix[row][col] < best_score[[row,col]]
        best_score[[row,col]] = best_score[[row+1,col]] + matrix[row][col]
        best_path[[row,col]] = 'D' #[row+1,col]
        changes = true
      end
    end
  end
end

best = best_score[[0,matrix.length-1]]

(1..( matrix.length - 1 )).each do |row|
  if best_score[[row,matrix.length-1]] < best
    best = best_score[[row,matrix.length-1]]
  end
end

puts best

=begin
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
=end


#pp best_score
#pp best_path
