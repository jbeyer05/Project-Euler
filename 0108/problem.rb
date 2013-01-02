require 'pp'

N = 1000

solutions     = 0
max_solutions = 0

$primes = [2,2]

def prime?( i )
  (2..(i**0.51).to_i).each do |j|
    if i % j == 0
      return false
    end
  end

  $primes << i
end

(3..100).each { |i| prime?( i ) }

def solutions( n )
  solutions = []

  (( n + 1 )..( 2 * n )).each do |x|
    y = ( -1 * x * n ) / ( n - x )

    solutions << [x,y] if n * ( y + x ) - x * y == 0
  end

  pp solutions
  solutions.length
end

n = 1
upper_bound = n
lower_bound = n

$primes.each do |p|
  n *= p
  puts "n = #{n}"

  if solutions( n ) > N
    lower_bound = n / p
    upper_bound = n
    break
  end
end

pp [lower_bound,upper_bound]

(lower_bound..upper_bound).step( 2 ) do |i|
  puts "testing #{i}"
  if solutions( i ) > N
    puts i
    puts solutions( i )
    exit
  end
end

exit


while solutions <= N
  solutions = 0

  (( n + 1 )..( 2 * n )).each do |x|
    y = ( -1 * x * n ) / ( n - x )

    solutions += 1 if n * ( y + x ) - x * y == 0

=begin
    temp = y * n + x * n - x * y

    while temp >= 0
      solutions += 1 if temp == 0
      y += 1
      temp = n * ( y + x ) - x * y
    end
=end
  end

  if solutions > max_solutions
    puts
    puts n
    puts solutions
    max_solutions = solutions
  end

  n *= 2
end

