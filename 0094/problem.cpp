#include <iostream>
#include "math.h"

using namespace std;

int N   = 1000000000; // 1,000,000,000
int e_s = 1; // equal side
long long sum = 0;


int max_e_s = ( N - 1 ) / 3;
int e_s2, s_s, s_s2;
long long area_squared_times_16;

bool square( int i )
{
  double d_sqrt = sqrt( i );
  long long i_sqrt = d_sqrt;

  if( d_sqrt == i_sqrt)
    return true;
  else
    return false;
}

int main( )
{
  while( e_s < max_e_s )
  {
    e_s2 = e_s * e_s;

    s_s = e_s + 1;
    s_s2 = s_s * s_s;
    area_squared_times_16 = s_s2 * ( 4 * e_s2 - s_s2 );

    if( area_squared_times_16 % 16 == 0 && square( area_squared_times_16/16 ))
    {
      sum += e_s * 2 + s_s;
      cout << e_s << ',' << s_s << endl;
    }

    s_s = e_s - 1;
    s_s2 = s_s * s_s;
    area_squared_times_16 = s_s2 * ( 4 * e_s2 - s_s2 );

    if( area_squared_times_16 % 16 == 0 && square( area_squared_times_16/16 ))
    {
      sum += e_s * 2 + s_s;
      cout << e_s << ',' << s_s << endl;
    }

    e_s++;
  }

  cout << sum << endl;
}
