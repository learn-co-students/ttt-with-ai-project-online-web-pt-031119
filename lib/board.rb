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
    puts "-----------"
    puts " #{self.cells[0]} | #{self.cells[1]} | #{self.cells[2]} "
    puts " #{self.cells[3]} | #{self.cells[4]} | #{self.cells[5]} "
    puts " #{self.cells[6]} | #{self.cells[7]} | #{self.cells[8]} "
  end

  def position(input)
    number = input.to_i - 1
    self.cells[number]
  end
  
  def update(position, player)
    number = position.to_i
    self.cells[number - 1] = player.token
  end

  def full?
    fullness = true
    self.cells.each do |c|
      if c === " "
        fullness = false
      end
    end
    fullness
  end

  def turn_count
    count = 0
    self.cells.each do |c|
      if c != " "
        count += 1
      end
    end
    count
  end

  def taken?(position)
    number = position.to_i - 1
    if self.cells[number] == " "
      false
    else
      true
    end
  end

  def valid_move?(input)
    number = input.to_i
    if number > 0 && number < 10 && self.cells[number - 1] === " "
      true
    else
      false
    end 
  end

end

#board = Board.new
#board.display