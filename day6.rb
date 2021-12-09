file = File.open("input6.txt")
input = file.read.split(",").map(&:to_i)
file.close

fishes = Array.new(9, 0)

input.each do |offset|
  fishes[offset] += 1
end

for i in 0...256
  nextDay = Array.new(9, 0)
  nextDay[6] += fishes[0]
  nextDay[8] += fishes[0]
  for i in 1..8
    nextDay[i - 1] += fishes[i]
  end

  fishes = nextDay
end

puts fishes.sum
