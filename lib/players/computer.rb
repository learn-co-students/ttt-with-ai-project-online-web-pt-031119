module Players
class Computer < Player
      
    def move(board)
        computer_move = rand(1..9)
        if board.valid_move?(computer_move)
            computer_move.to_s
        else
            self.move
        end
    end
    
end
end