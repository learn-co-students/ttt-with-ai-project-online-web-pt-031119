module Players
class Computer < Player
      
    def move(board)
        if !board.taken?(5)
        computer_move = 5
        else
        computer_move = rand(1..9)
        end

        if board.valid_move?(computer_move)
            computer_move.to_s
        else
            self.move(board)
        end
    end
    
end
end