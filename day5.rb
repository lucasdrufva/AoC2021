file = File.open("input5.txt")
$input = file.readlines
file.close

def countOverlapping(enableDiagonal)
  grid = Hash.new

  $input.each do |line|
    x1, y1, x2, y2 = line.match(/(\d+),(\d+) -> (\d+),(\d+)/).captures.map(&:to_i)

    xs = x1 <= x2 ? (x1..x2).to_a : (x2..x1).to_a.reverse
    ys = y1 <= y2 ? (y1..y2).to_a : (y2..y1).to_a.reverse

    diagonal = xs.length > 1 && ys.length > 1

    if enableDiagonal
      positions = diagonal ? xs.zip(ys) : xs.product(ys)
    else
      positions = diagonal ? [] : xs.product(ys)
    end

    positions.each do |pos|
      if !grid.key?(pos)
        grid[pos] = 0
      end
      grid[pos] += 1
    end
  end

  return grid.select { |k, v| v > 1 }.count
end

puts "Part1:"
puts countOverlapping(false)

puts "Part2:"
puts countOverlapping(true)
