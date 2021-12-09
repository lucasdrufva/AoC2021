file = File.open("input7.txt")
input = file.read.split(",").map(&:to_i)
file.close

puts "part1: "
puts (0..2000).map { |pos| input.sum { |x| (x - pos).abs } }.min

puts "part2: "
puts (0..2000).map { |pos| input.sum { |x| dist = (x - pos).abs; (dist * (dist + 1)) / 2 } }.min
