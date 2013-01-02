require 'pp'

matrix = File.readlines( '0081/matrix.txt' )
matrix.map! do |line|
  line.chomp.split( ',' ).map! do |num|
    num.to_i
  end
end

best_score = { [0,0] => matrix[0][0] }
best_path  = { [0,0] => nil }

(1..( matrix.length - 1 )).each do |i|
  best_score[[0,i]] = matrix[0][i] + best_score[[0,i-1]]
  best_score[[i,0]] = matrix[i][0] + best_score[[i-1,0]]

  best_path[[0,i]] = [0,i-1]
  best_path[[i,0]] = [i-1,0]
end


(1..( matrix.length - 1 )).each do |distance|
  (1..distance).each do |i|
    j = distance - i + 1

    if best_score[[i-1,j]] < best_score[[i,j-1]]
      best_score[[i,j]] = best_score[[i-1,j]] + matrix[i][j]
      best_path[[i,j]]  = [i-1,j]
    else
      best_score[[i,j]] = best_score[[i,j-1]] + matrix[i][j]
      best_path[[i,j]]  = [i,j-1]
    end
  end
end

(1..( matrix.length - 1 )).each do |distance|
  (distance..( matrix.length - 1 )).each do |i|
    j = matrix.length + distance - i - 1

    if best_score[[i-1,j]] < best_score[[i,j-1]]
      best_score[[i,j]] = matrix[i][j] + best_score[[i-1,j]]
      best_path[[i,j]] = [i,j-1]
    else
      best_score[[i,j]] = matrix[i][j] + best_score[[i,j-1]]
      best_path[[i,j]] = [i-1,j]
    end
  end
end

pp best_score[[79,79]]
#pp best_path
