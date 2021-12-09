require "set"

file = File.open("input8.txt")
input = file.readlines.map { |l| l.split("|") }
file.close

sum = 0

input.each do |line|
  l = line[0].split(" ").map { |x| x.split("") } + line[1].split(" ").map { |x| x.split("") }

  #Index real number to dispaly -> signal pattern for number
  signalMapping = Array.new(10)

  l.each do |x|
    if x.length == 2
      signalMapping[1] = x
    elsif x.length == 3
      signalMapping[7] = x
    elsif x.length == 4
      signalMapping[4] = x
    elsif x.length == 7
      signalMapping[8] = x
    end
  end

  signalMapping[6] = l.find { |x| x.length == 6 && (x & signalMapping[1]).length == 1 }
  l = l.reject { |x| x & signalMapping[6] == x && x.length == signalMapping[6].length }

  signalMapping[5] = l.find { |x| x.length == 5 && (x & signalMapping[6]).length == 5 }
  l = l.reject { |x| x & signalMapping[5] == x && x.length == signalMapping[5].length }

  signalMapping[3] = l.find { |x| x.length == 5 && (x & signalMapping[1]).length == 2 }
  l = l.reject { |x| x & signalMapping[3] == x && x.length == signalMapping[3].length }

  signalMapping[2] = l.find { |x| x.length == 5 && (x & signalMapping[3]).length == 4 }
  l = l.reject { |x| x & signalMapping[2] == x && x.length == signalMapping[2].length }

  signalMapping[9] = l.find { |x| x.length == 6 && (x & signalMapping[4]).length == 4 }
  l = l.reject { |x| x & signalMapping[9] == x && x.length == signalMapping[9].length }

  signalMapping[0] = l.find { |x| x.length == 6 && (x & signalMapping[4]).length == 3 }

  final = ""
  real = line[1].split(" ").map { |x| x.split("") }

  real.each do |x|
    final += signalMapping.index { |a| a.to_set == x.to_set }.to_s
  end

  sum += final.to_i
end

puts sum
