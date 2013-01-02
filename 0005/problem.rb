
i = 20

DENOMS = [20,19,18,17,16,15,14,13,12,11]

while true
  works = true

  DENOMS.each do |j|
    if i % j != 0
      works = false
      break
    end
  end

  if works
    puts i
    exit
  end

  i += 20
end
