require 'pp'

lines = File.readlines( '0102/triangles.txt' )

triangles = lines.map do |l|
  l = l.split( ',' )
  [[l[0].to_f,l[1].to_f],[l[2].to_f,l[3].to_f],[l[4].to_f,l[5].to_f]]
end


count = 0

triangles.each do |t|
  x_ints = []
  y_ints = []

  p1 = t[0]
  p2 = t[1]
  p3 = t[2]

  m1 = ( p2[1] - p1[1] ) / ( -1 * p1[0] + p2[0] )
  b1 = p1[1] - p1[0] * m1

  x1 = -1 * b1 / m1
  y1 = b1

  if ( p1[0]..p2[0] ) === x1 || ( p2[0]..p1[0] ) === x1
    x_ints << x1
  end

  if ( p1[1]..p2[1] ) === y1 || ( p2[1]..p1[1] ) === y1
    y_ints << y1
  end

  m2 = ( p3[1] - p2[1] ) / ( -1 * p2[0] + p3[0] )
  b2 = p2[1] - p2[0] * m2

  x2 = -1 * b2 / m2
  y2 = b2

  if ( p2[0]..p3[0] ) === x2 || ( p3[0]..p2[0] ) === x2
    x_ints << x2
  end

  if ( p2[1]..p3[1] ) === y2 || ( p3[1]..p2[1] ) === y2
    y_ints << y2
  end

  m3 = ( p1[1] - p3[1] ) / ( -1 * p3[0] + p1[0] )
  b3 = p3[1] - p3[0] * m3

  x3 = -1 * b3 / m3
  y3 = b3

  if ( p1[0]..p3[0] ) === x3 || ( p3[0]..p1[0] ) === x3
    x_ints << x3
  end

  if ( p1[1]..p3[1] ) === y3 || ( p3[1]..p1[1] ) === y3
    y_ints << y3
  end

  if y_ints.length == 2 && y_ints[0] * y_ints[1] < 0.01 &&
     x_ints.length == 2 && x_ints[0] * x_ints[1] < 0.01
    count += 1
  end
end

puts count
