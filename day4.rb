require "set"
file = File.open("input4.txt")
drawOrder, *rawBoards = file.read.strip.split("\n\n")
file.close

drawOrder = drawOrder.split(",").map(&:to_i)
boards = rawBoards.map { |l| l.split("\n").map { |n| n.split(" ").map(&:to_i) } }

def isWinner(board)
  return (board + board.transpose).any? { |b| b.all? { |x| $drawn.include?(x) } }
end

$drawn = Set.new
winner = nil

for n in drawOrder
  $drawn.add(n)

  if winner == nil
    winner = boards.find { |b| isWinner(b) }

    if winner != nil
      puts "Winner! Part1:"
      score = winner.flatten.filter { |x| !$drawn.include?(x) }.sum
      puts "#{score * n}"
    end
  end

  oldBoards = boards
  boards = boards.filter { |b| !isWinner(b) }

  if boards.length == 0
    puts "Looser! Part2:"
    score = oldBoards[0].flatten.filter { |x| !$drawn.include?(x) }.sum
    puts "#{score * n}"
    return
  end
end
