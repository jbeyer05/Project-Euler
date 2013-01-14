#include <stdio.h>
#include <math.h>

int N = 200000;
int sum = 0;

bool square( int n )
{
  double temp = pow( n, 0.5 );
  long sqrt1 = floor( temp );
  long sqrt2 = ceil( temp );

  if( sqrt1 * sqrt1 == n || sqrt2 * sqrt2 == n )
    return true;
  else
    return false;
}

int main( void )
{
  for( int n = 1; n <= N - 1; n++ )
  {
    long long ss_divisors = 0;

    for( int divisor = 1; divisor < pow( n, 0.51 ); divisor++ )
    {
      if( n % divisor == 0 )
      {
        int divisor2 = n / divisor;

        if( divisor2 == divisor )
          ss_divisors += ( divisor * divisor );
        else
          ss_divisors += ( divisor * divisor ) + ( divisor2 * divisor2 );
      }
    }

    if( square( ss_divisors ))
    {
      printf( "%d is good\n", n );
      sum += n;
    }
  }

  printf( "sum: %d\n", sum );

  return 0;
}


/*
(1..(N-1)).each do |n|
  ss_divisors = 0

  (1..(n**0.51).to_i).each do |divisor|
    if n % divisor == 0
      divisor2 = n / divisor
      ss_divisors += ( divisor * divisor ) + ( divisor2 * divisor2 )
    end
  end

  sum += n if square?( ss_divisors )
end

puts sum
*/
