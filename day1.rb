input = File.open("input1.txt").readlines.map(&:to_i)

puts "Part 1: "
puts input.each_cons(2).count { |a, b| b > a }

puts "Part 2:"
puts input.each_cons(4).count { |a, b, c, d| a + b + c < b + c + d }
