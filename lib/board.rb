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
    puts self.cells[0..2].join(" | ")
    puts self.cells[3..5].join(" | ")
    puts self.cells[6..8].join(" | ")
  end

  def position
  end
  
  def update (position, player)
  end

  def full?
  end

  def turn_count
  end

  def taken?
  end

  def valid_move?
  end

end

#board = Board.new
#board.display