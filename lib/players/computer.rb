require_relative '../player.rb'

module Players
  class Computer < Player

    def move(board)
      emptyCells = []
      board.cells.each_with_index do |location,index|
        if location == ' '
          position = index + 1
          emptyCells << position.to_s
        end
      end
      number = Random.rand(0...emptyCells.length)
      return emptyCells[number]
    end

  end
end