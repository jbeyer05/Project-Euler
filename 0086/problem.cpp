#include <iostream>
#include "math.h"

using namespace std;

const int MAX_CUBOIDS = 1000000;
const int MAX_M       = 2000;
const int MAX_SQUARE  = MAX_M * MAX_M + ( MAX_M + MAX_M ) * ( MAX_M + MAX_M );

int m   = 1;
int cnt = 0;
double d_sqrt;
int i_sqrt;
int min_square;

int main( )
{
  int a2, b, c;

  while( 1 )
  {
    a2 = m * m;

    for( b = 1; b <= m; b++ )
    {
      for( c = b; c <= m; c++ )
      {
        min_square = a2 + ( b + c ) * ( b + c );

        d_sqrt = sqrt( min_square );
        i_sqrt = d_sqrt;

        if( d_sqrt == i_sqrt)
          cnt++;
      }
    }

    if( cnt > MAX_CUBOIDS )
      break;

    m += 1;
  }

  cout << m << endl;
}
