#include <stdio.h>
#include <math.h>
#include <stdlib.h>
#include <vector>
#include <set>
#include <algorithm>

using namespace std;

int N = 64000000;
bool *checked;
bool *primes;
int *prime_array;
long long sum = 0;
int num_primes = 0;

vector<int> squares;
set<int> squares_hash;


void prime_sieve( int n )
{
  for( int i = 2; i < pow( n, 0.51 ); i++ )
  {
    if( ! primes[i] )
      continue;

//    printf( "SIEVING %d\n", i );

    for( int j = 2; j <= n / i; j++ )
      primes[i*j] = false;
  }
}

void initialize_squares( )
{
  squares.push_back( 1 );
  squares_hash.insert( 1 );
}

bool is_square( int n )
{
  int last_square = squares.back( );

  if( n > last_square )
  {
    int i = 0;

    while( i * i < last_square * 10 )
    {
      if( i * i > last_square )
      {
        squares.push_back( i * i );
        squares_hash.insert( i * i );
      }

      i++;
    }
  }

  set<int>::iterator it = squares_hash.find( n );

  return ! ( it == squares_hash.end( ));
}

void dfs( vector<int> factors, int n )
{
  checked[n] = true;

  int ss_factors = 0;

  for( int i = 0; i < factors.size( ); i++ )
    ss_factors += factors[i] * factors[i];

  if( is_square( ss_factors ))
    sum += n;

  int prime_index = 0;

  int new_factor = prime_array[prime_index];

  while( prime_index < num_primes && ( n * new_factor < N ))
  {
    if( ! checked[ n * new_factor ] )
    {
      vector<int> new_factors = factors;

      for( int i = 0; i < factors.size( ); i++ )
        new_factors.push_back( factors[i] * new_factor );

      std::sort( new_factors.begin( ), new_factors.end( ));
      new_factors.erase( unique( new_factors.begin( ), new_factors.end( )), new_factors.end( ));

      dfs( new_factors, n * new_factor );
    }

    prime_index++;
    new_factor = prime_array[prime_index];
  }
}

/*
def dfs( factors, n )
#  puts "dfs( #{factors.join( ',' )}, #{n} )"
#  return if $checked[n]

  $checked[n] = true

  ss_factors = 0
  factors.each do |factor|
    ss_factors += factor * factor
  end

  if square?( ss_factors )
    $sum += n
  end

  prime_index = 0
  new_factor = $prime_array[prime_index]

  while new_factor && ( n * new_factor < N )
    if ! $checked[ n * new_factor ]
      new_factors = factors.dup
      factors.each do |factor|
        new_factors << factor * new_factor
      end

      new_factors.uniq!

      dfs( new_factors, n * new_factor )
    end

    prime_index += 1
    new_factor = $prime_array[prime_index]
  end
end
*/

int main( void )
{
  initialize_squares( );

  checked = (bool *) malloc( N * sizeof( bool ));
  primes  = (bool *) malloc( N * sizeof( bool ));

  for( int i = 0; i < N; i++ )
  {
    checked[i] = false;
    primes[i]  = true;
  }

  prime_sieve( N );

  for( int i = 2; i < N; i++ )
    if( primes[i] )
      num_primes++;

  prime_array = (int *) malloc( num_primes * sizeof( int ));

  for( int i = 2, ary_cnt = 0; i < N; i++ )
    if( primes[i] )
      prime_array[ary_cnt++] = i;

  printf( "DONE GENERATING PRIMES\n" );

  vector<int> temp_ary( 1 );
  temp_ary[0] = 1;

  dfs( temp_ary, 1 );

  printf( "SUM is %lld\n", sum );
}
