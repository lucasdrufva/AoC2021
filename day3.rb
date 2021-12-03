file = File.open("input3.txt")

input = file.readlines.map(&:strip).map(&:chars)

file.close

gamma = input.transpose.map { |l| l.count("1") < l.count("0") ? "0" : "1" }.join("").to_i(2)
epsilon = input.transpose.map { |l| l.count("0") > l.count("1") ? "1" : "0" }.join("").to_i(2)

puts "Part 1: #{gamma * epsilon}"

oxygen = input.clone
co2 = input.clone

for i in 0...input[0].length
  if oxygen.length > 1
    oxyColumn = oxygen.transpose[i]
    mostCommonOxy = oxyColumn.count("0") <= oxyColumn.count("1") ? "1" : "0"
    oxygen = oxygen.filter { |l| l[i] == mostCommonOxy }
  end

  if co2.length > 1
    co2Column = co2.transpose[i]
    mostCommonCo2 = co2Column.count("0") <= co2Column.count("1") ? "0" : "1"
    co2 = co2.filter { |l| l[i] == mostCommonCo2 }
  end
end

puts "Part 2: #{oxygen[0].join("").to_i(2) * co2[0].join("").to_i(2)}"
