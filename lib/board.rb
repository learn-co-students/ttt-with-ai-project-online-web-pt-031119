class Board

  attr_accessor :cells

  def initialize
    @cells = Array.new(9, " ")
  end

  def reset!
    cells.clear
    self.cells = Array.new(9, " ")
  end

  def display
    puts " #{self.cells[0]} | #{self.cells[1]} | #{self.cells[2]} "
    puts "-----------"
    puts " #{self.cells[3]} | #{self.cells[4]} | #{self.cells[5]} "
    puts "-----------"
    puts " #{self.cells[6]} | #{self.cells[7]} | #{self.cells[8]} "
    puts "\n"
  end

  def position(value)
    self.cells[value.to_i - 1]
  end

  def full?
    if self.cells.include?(" ")
      false
    else
      true
    end
  end

  def turn_count
    count = 0
    self.cells.each do |x|
      if x != " "
        count += 1
      end
    end
    count
  end

  def taken?(value)
    if self.position(value) == "X" || self.position(value) == "O"
      true
    else
      false
    end
  end

  def valid_move?(value)
    if (1..9).include?(value.to_i) && self.taken?(value) == false
      true
    else
      false
    end
  end

  def update(cell, player)
    self.cells[cell.to_i - 1] = player.token
    self.display
  end

end
