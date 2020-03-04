require_relative '../player.rb'

module Players
  class Human < Player

    def move(position)
      puts "Please enter your move."
      input = gets
      return input
    end

  end
end