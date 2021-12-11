file = File.open("input11.txt")
grid = file.readlines.map { |x| x.strip.split("").map { |y| y.to_i } }
file.close

def neighbors(pos, grid)
  return [
           [pos[0] - 1, pos[1] - 1],
           [pos[0] + 1, pos[1] + 1],
           [pos[0] - 1, pos[1] + 1],
           [pos[0] + 1, pos[1] - 1],
           [pos[0] + 1, pos[1]],
           [pos[0] - 1, pos[1]],
           [pos[0], pos[1] - 1],
           [pos[0], pos[1] + 1],
         ].filter { |y, x| y >= 0 && x >= 0 && y < grid.length && x < grid[y].length }
end

count = 0

for steps in (1..1000)
  grid = grid.map { |line| line.map { |x| x + 1 } }

  change = true
  flashes = []
  while change
    change = false
    for i in 0...grid.length
      for j in 0...grid[i].length
        if grid[i][j] > 9 && !flashes.include?([i, j])
          grid[i][j] = 0
          flashes.append([i, j])

          for neigh in neighbors([i, j], grid).filter { |neigh| !flashes.include?(neigh) }
            grid[neigh[0]][neigh[1]] += 1
            change = true
          end
        end
      end
    end
  end

  count += flashes.length

  if steps == 100
    puts "Part1"
    puts count
  end

  if flashes.length == 100
    puts "Part2"
    puts steps
    break
  end
end
