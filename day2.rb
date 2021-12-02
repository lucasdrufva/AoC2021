file = File.open("input2.txt")

input = file.readlines

file.close

hor = 0
depth1 = 0
depth2 = 0
aim = 0

input.each do |line|
  case line
  when /forward (\d+)/
    hor += $1.to_i
    depth2 += aim * $1.to_i
  when /down (\d+)/
    aim += $1.to_i
    depth1 += $1.to_i
  when /up (\d+)/
    aim -= $1.to_i
    depth1 -= $1.to_i
  end
end

puts "Part1: #{hor * depth1}"
puts "Part2: #{hor * depth2}"
