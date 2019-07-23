module Players
  class Human < Player

    def move(input)
      puts "Player #{self.token}, please choose a square by typing a number 1-9 and press Enter."
      input = gets.chomp
      input
    end

  end
end
