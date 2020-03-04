class Board
  def initialize
    @cells = Array.new(9,' ')
    return @cells
  end

  def cells=(cells)
    @cells = cells
    return @cells
  end

  def cells
    return @cells
  end

  def reset!
    @cells = Array.new(9,' ')
    return @cells
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(input)
    cellPos = input.to_i
    return @cells[cellPos-1]
  end

  def full?
    if @cells.include?(' ')
      return false
    else
      return true
    end
  end

  def turn_count
    markedCells = @cells - [" "]
    return markedCells.count
  end

  def taken?(cellLocation)
    checkSpot = cellLocation.to_i
    if @cells[checkSpot-1] == "X" || @cells[checkSpot-1] == "O"
      return true
    else
      return false
    end

  end

  def valid_move?(input)
    if input.to_i != 0
      cellLookup = input.to_i
      if @cells[cellLookup-1] == ' '
        return true
      else
        return false
      end
    else
      return false
    end
  end

  def update(input,token)
    playerInput = input.to_i
    @cells[playerInput-1] = token.token
  end

end
