file = File.open("input10.txt")
input = file.readlines.map { |x| x.split("") }
file.close

score1 = 0 #Part 1 score
scoreTable1 = { ")" => 3, "]" => 57, "}" => 1197, ">" => 25137 }
pairs = { ")" => "(", "]" => "[", "}" => "{", ">" => "<" }

# Opened pairs that need closing
leftToAutocomplete = []

input.each do |line|
  chunkStack = []
  illegal = false

  line.each do |c|
    case c
    when "(", "[", "{", "<"
      chunkStack.append(c)
    when ")", "]", "}", ">"
      last = chunkStack.pop()
      if pairs[c] != last
        illegal = true
        score1 += scoreTable1[c]
        break
      end
    end
  end
  if !illegal
    leftToAutocomplete.append(chunkStack)
  end
end

puts "Part1:"
puts score1

scores2 = []
scoreTable2 = { "(" => 1, "[" => 2, "{" => 3, "<" => 4 }

leftToAutocomplete.each do |line|
  scores2.append(line.reverse.inject(0) { |sum, c| sum * 5 + scoreTable2[c] })
end

puts "Part2:"
puts scores2.sort[scores2.length / 2]
