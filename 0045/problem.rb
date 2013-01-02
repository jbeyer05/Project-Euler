
$tris  = {}
$pents = {}
$hexs  = {}

(1..100000).each do |i|
  $tris[i * ( i + 1 ) / 2]      = true
  $pents[i * ( 3 * i - 1 ) / 2] = true
  $hexs[i * ( 2 * i - 1 )]      = true
end

$hexs.each_key do |i|
  if $tris[i] && $pents[i]
    puts i
  end
end
