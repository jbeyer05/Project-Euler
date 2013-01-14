#include <cstdlib>
#include <stdio.h>
#include <limits.h>
#include <math.h>

int N = 100000000;

int main( int argc, char argv[] )
{
  bool *primes = (bool *) malloc( sizeof( bool ) * N );
  long long cnt = 0;
  long long sum = 0;

  for( int i = 0; i < N; i++ )
    primes[i] = true;

  int max_i = pow( N, 0.51 );

  for( int i = 2; i <= max_i; i++ )
  {
    if( ! primes[i] )
      continue;

    printf( "SIEVING %d\n", i );

    for( int j = 2; j <= N / i; j++ )
      primes[i*j] = false;
  }

  for( int i = 1; i < N - 1; i++ )
  {
    bool i_good = true;

    for( int divisor = 1; divisor <= pow( i, 0.51 ); divisor++ )
    {
      if( i % divisor == 0 )
      {
        int divisor2 = i / divisor;

        if( ! primes[divisor + i / divisor] || ! primes[divisor2 + i / divisor2] )
        {
          i_good = false;

          break;
        }
      }
    }

    if( i_good )
    {
      sum += i;
      cnt += 1;
    }
  }

  printf( "cnt = %lld\n", cnt );
  printf( "sum = %lld\n", sum );

  return 0;
}
