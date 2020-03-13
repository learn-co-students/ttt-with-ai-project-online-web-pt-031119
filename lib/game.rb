class Game
    
    attr_accessor :board, :player_1, :player_2
    WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]]

    def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O") , board = Board.new)
        @player_1 = player_1
        @player_2 = player_2
        @board = board
    end

    def current_player
        if self.board.turn_count.even?
            @player_1
        else
            @player_2
        end
    end

    def won?
            # array = []
            WIN_COMBINATIONS.each do |combination|
                index_1 = combination[0]
                index_2 = combination[1]
                index_3 = combination[2]
                position_1 = self.board.cells[index_1]
                position_2 = self.board.cells[index_2]
                position_3 = self.board.cells[index_3]
                if position_1 == position_2 && position_2 == position_3 && position_1 != " "
                   return combination  
                end
                # combination.each do |number|
                #     array << self.board.cells[number]
                #     if array.uniq.size == 1 && array.size == 3
                #         return combination.join(', ')
                #     else
                #        return false
                #     end
                # end
            end
            false
    end

    def draw?
        if !self.won? && self.board.full?
            true
        else
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
        
    def play
        while !self.over?
        self.turn
        end
        if self.won?
            puts "Congratulations #{self.winner}!"
        elsif self.draw?
            puts "Cat's Game!"
        end
    end

    def winner
        combination = self.won?
       if combination
        index = combination[0]
        self.board.cells[index]
       else
        nil
       end
    end

    def turn
        puts "please enter 1-9"
        current_move = self.current_player.move(self.board)
        if !self.board.valid_move?(current_move)
          self.turn 
        else
            self.board.update(current_move, self.current_player)
            self.board.display
            self.board.turn_count
        end
    end
end
