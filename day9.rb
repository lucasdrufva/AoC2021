require "set"

file = File.open("input9.txt")
$input = file.readlines.map { |x| x.chomp.split("").map { |x| x.to_i } }
file.close

def getNeighs(y, x)
  neighs = []
  y + 1 < $input.length && neighs.append([y + 1, x])
  y - 1 >= 0 && neighs.append([y - 1, x])

  x + 1 < $input[y].length && neighs.append([y, x + 1])
  x - 1 >= 0 && neighs.append([y, x - 1])

  return neighs
end

risk = 0

lowPoints = []

for i in 0...$input.length
  for j in 0...$input[i].length
    lower = 0
    neigCount = 0
    for neigh in getNeighs(i, j)
      neigCount += 1
      if $input[neigh[0]][neigh[1]] > $input[i][j]
        lower += 1
      end
    end
    if lower == neigCount
      risk += $input[i][j] + 1
      lowPoints.append([i, j])
    end
  end
end
puts "part 1:"
puts risk

basinSizes = []

lowPoints.each do |lowPoint|
  explored = Set.new([lowPoint])
  to_explore = [lowPoint]
  size = 0

  while to_explore.length > 0
    v = to_explore.shift()
    if $input[v[0]][v[1]] == 9
      #Basin wall, do not count
      next
    else
      size += 1
    end

    for neigh in getNeighs(v[0], v[1])
      if !explored.include?(neigh)
        to_explore.append(neigh)
        explored.add(neigh)
      end
    end
  end

  basinSizes.append(size)
end

puts "Part2:"
puts basinSizes.sort.reverse[0...3].inject(&:*)
