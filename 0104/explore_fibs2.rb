
def f_pandigital?( str )
  str[0,9].split( // ).sort.join == '123456789'
end

def r_pandigital?( str )
  return false if str.length < 9
  str[-9,9].split( // ).sort.join == '123456789'
end

fn2 = 1
fn1 = 1
fs2 = 1
fs1 = 1

i = 2

while i < 400000
  fib = fn2 + fn1
  fn2 = fn1
  fn1 = fib

  fs  = fs2 + fs1
  fs2 = fs1
  fs1 = fs % 10**9

  i += 1

  if r_pandigital?( fs1.to_s )
    fib_s = fn1.to_s

    if f_pandigital?( fib_s )
      puts i
      exit
    end

    while fib_s.length > 200
      fn1 /= 10**100
      fn2 /= 10**100

      fib_s = fn1.to_s
    end
  end
end
