require_relative './board.rb'
require_relative './players/human.rb'

class Game
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
  ]

  def initialize(player_1 = Players::Human.new("X"),player_2 = Players::Human.new("O"),board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def board=(board)
    @board = board
    return @board
  end

  def board
    return @board
  end

  def player_1=(player)
    @player_1 = player
    return @player_1
  end

  def player_1
    return @player_1
  end

  def player_2=(player)
    @player_2 = player
    return @player_2
  end

  def player_2
    return @player_2
  end

  def current_player
    turnsTaken = @board.cells.count{|token| token == "X" || token == "O"}
    whoseTurn = turnsTaken % 2 == 0 ? "X" : "O"
    if whoseTurn == "X"
      return @player_1
    else
      return @player_2
    end
  end

  def won?
    WIN_COMBINATIONS.detect do |numSeries|
      @board.cells[numSeries[0]] == @board.cells[numSeries[1]] && @board.cells[numSeries[1]] == @board.cells[numSeries[2]] && @board.cells[numSeries[1]] != " "
    end

  end

  def draw?
    if won?
      return false
    elsif @board.full? && !won?
      return true
    end 
  end

  def over?
    if won? || draw? || @board.full?
      return true
    else
      return false
    end
  end

  def winner
    if won?
      return @board.cells[won?[0]]
    end
  end

  def turn
    turnEntry = current_player.move(self).to_i

    if @board.cells[turnEntry-1] == " "
      @board.cells[turnEntry-1] = current_player.token
    else
      puts 'Invalid move, try again'
      self.turn
    end
    
  end

end