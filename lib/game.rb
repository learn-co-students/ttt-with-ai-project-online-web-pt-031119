require_relative './board.rb'
require_relative './players/human.rb'
require_relative './players/computer.rb'

class Game
  attr_accessor :board, :player_1, :player_2
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

  def comp_v_comp
    @game = Game.new(player_1 = Players::Computer.new("X"),player_2=Players::Computer.new("O"))
    @game.play
  end

  def p_v_comp
    puts "X or O?"
    playToken = gets.chomp()
    if playToken == "X"
      @game = Game.new(player_1 = Players::Human.new(playToken),player_2 = Players::Computer.new("O"))
      @game.play
    else
      @game = Game.new(player_1 = Players::Human.new(playToken),player_2 = Players::Computer.new("X"))
      @game.play
    end
  end

  def p_v_p
    puts "Player One: X or O?"
    playToken = gets.chomp()
    if playToken == "X"
      @game = Game.new(player_1 = Players::Human.new(playToken),player_2 = Players::Human.new("O"))
      @game.play
    else
      @game = Game.new(player_1 = Players::Human.new(playToken),player_2 = Players::Human.new("X"))
      @game.play
    end
  end

  def player_setup
    puts "How many players?"
    players = gets.chomp()
    if players == "0"
      comp_v_comp
    elsif players == "1"
      p_v_comp
    elsif players == "2"
      p_v_p
    end
  end

  def start
    puts "Welcome to Tic-Tac-Toe!"
    player_setup
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
    turnEntry = current_player.move(@board).to_i
    puts "Current Player: #{current_player.token}"
    if @board.valid_move?(turnEntry)
      @board.update(turnEntry,current_player)
    else
      puts "Invalid"
      @board.display
      turn
    end
    
  end

  def play
    if !over?
      @board.display
      turn
      play
    elsif draw?
      puts "Cat's Game!"
    elsif won?
      puts "Congratulations #{winner}!"
    end
  end

end