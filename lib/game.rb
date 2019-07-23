class Game

  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]]

  def initialize(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board=Board.new)
    @player_1= player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    if self.board.turn_count.even?
      player_1
    else
      player_2
    end
  end

  def won?
    x_combo = []
    o_combo = []

    WIN_COMBINATIONS.collect do |combo|
      count_x = 0
      count_o = 0

      combo.each do |position|
        if self.board.cells[position] == "X"
          count_x += 1
        elsif self.board.cells[position] == "O"
          count_o += 1
        end
      end

      if count_x == 3
        x_combo = combo
      end
      if count_o == 3
        o_combo = combo
      end
    end

    if x_combo == o_combo
     false
    elsif x_combo.length == 3 && x_combo != o_combo
      x_combo
    elsif o_combo.length == 3 && o_combo != x_combo
      o_combo
    end
  end


  def draw?
    if self.won? == false && self.board.full?
      true
    elsif self.won?
      false
    end
  end

  def over?
    if self.draw? || self.won?
      true
    else
      false
    end
  end


  def winner
    win_array = []

    if self.over? && self.draw? == false
      self.won?.each do |position|
        win_array << board.cells[position]
      end

      if win_array.include?("X")
        "X"
      elsif win_array.include?("O")
        "O"
      end

    elsif self.draw? == true
      nil
    end
  end

  def turn
    move = current_player.move(board)
    if board.valid_move?(move) == false
      self.turn
    else
      board.update(move, current_player)
    end
  end

  def play
    board.display
    until self.over?
      self.turn
    end
    if self.won?
      puts "Congratulations #{self.winner}!"
      puts "\n"
      puts "\n"
    elsif self.draw?
      puts "Cat's Game!"
      puts "\n"
      puts "\n"
    end
  end

end
