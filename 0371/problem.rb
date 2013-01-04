require 'pp'

N = 25

=begin
prob =
{
       (anything but 0) * (one matching plate)
  2 => 999 / 1000.0     * 1 / 1000.0
  2 => 0.000999
  3 => 0.001994004


0             => 0.001
1-999         => 0.999
0,0           => 0.000001
0,1-999       => 0.000999
1-999,0       => 0.000999
1-999,1-999   => 0.999 * 0.999 - prob[2]
0,1-999,m     => 0.000999 * 0.001
1-999,1-999,m => ( 0.999 * 0.999 - prob[2] ) * 2 / 1000
m             => 0.000999 * 0.001 + ( 0.999 * 0.999 - prob[2] ) * 2 / 1000

0,0

=end


def dfs( max_plates, total_plates, unique_non_zeros )
  if total_plates + 1 == max_plates
    return unique_non_zeros / 1000.0
  else
    sum_probs = 0.0
    # probability of getting either a zero or getting a non-zero number that we have already seen
    sum_probs += (( 1 + unique_non_zeros ) / 1000.0 ) * dfs( max_plates, total_plates + 1, unique_non_zeros )
    sum_probs += (( 999 - unique_non_zeros ) / 1000.0 ) * dfs( max_plates, total_plates + 1, unique_non_zeros + 1 )

    return sum_probs
  end
end

(2..N).each do |n|
  puts "probability of matching plate after #{n} : #{dfs( n, 0, 0 )}"
end



# NEED TO FIGURE OUT THE PROBABILITY OF GETTING 1,000 in 2, 3, 4, 5, 6, 7, 8, 9....10^6 plates
# expected number of plates is simply summation of probability * number of plates
