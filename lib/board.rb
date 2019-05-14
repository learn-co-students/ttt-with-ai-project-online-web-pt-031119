require "pry"

class Board
  attr_accessor :cells
  
  def initialize
    @cells = Array.new(9, " ")
  end
  
  def reset!
    new_array = Array.new(9, " ")
    @cells = new_array
  end
  
  def display
    print self.cells[0..2].join(" | ")
  end
  
end

#board = Board.new
#board.display