file = File.open("input12.txt")
input = file.readlines.map { |x| x.strip.split("-") }
file.close

$cave = Hash.new([])

input.each do |line|
  $cave[line[0]] += [line[1]]
  $cave[line[1]] += [line[0]]
end

$pathCount = 0

def countPaths(start, path, visitedDouble)
  if start == "end"
    $pathCount += 1
    return
  end

  if start == start.downcase && path.include?(start)
    return 0 if visitedDouble || start == "start"
    visitedDouble = true
  end

  $cave[start].each do |way|
    countPaths(way, path + [start], visitedDouble)
  end
  return
end

countPaths("start", [], true)
puts "part 1"
puts $pathCount

$pathCount = 0
countPaths("start", [], false)
puts "part 2"
puts $pathCount
