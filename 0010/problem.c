#include <stdio.h>
#include <math.h>

int N   = 2000000;
int sum = 2;

bool is_prime( int i )
{
  for( int j = 2; j < pow( i, 0.5 ) + 1; j++ )
  {
    if( i % j == 0 )
      return false;
  }

  return true;
}

int main( void )
{
  for( int i = 3; i < N; i += 2 )
  {
    if( is_prime( i ))
    {
      sum += i;
    }
  }

  printf( "%d\n", sum );

  return 0;
}
