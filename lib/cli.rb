class CommandLineInterface

  attr_accessor :game, :game_type, :letter, :player_choice

  def initialize
    @game = []
  end

  def run
    game_selection_menu
    game.play
    again_or_exit
  end

  def game_selection_menu
    puts "Hello and Welcome to the CLI Tic Tac Toe game!"
    puts "\n"
    puts "Please choose which type of game you would like to play:"
    puts "  1.  0 Player - Computer vs Computer"
    puts "  2.  1 Player - You vs Computer"
    puts "  3.  2 Player - Person vs Person"
    self.game_type = nil
    self.game_type = gets.chomp
    select_game
  end

  def select_letter
    puts "Which letter would you like to be, X or O?  Type X or O and press Enter."
    self.letter = nil
    self.letter = gets.chomp
  end

  def select_player
    puts "And which player would you like to be?  Type 1 or 2 and press Enter."
    puts "  1. Player 1 (goes first)"
    puts "  2. Player 2 (goes second)"
    self.player_choice = gets.chomp
  end


  def select_game
        case game_type

        when "1"
          puts "This is a game between two computer players and no input from you is required."
          self.game = Game.new(player_1=Players::Computer.new("X"), player_2=Players::Computer.new("O"))

        when "2"
          puts "You will be playing against the computer."
          choices = {"X" => "O", "O" => "X"}
          select_letter
            if self.letter == "X" || self.letter == "O"
            select_player
            if self.player_choice == "1"
               self.game = Game.new(player_1 = Players::Human.new(letter), player_2 = Players::Computer.new(choices[letter]))
            elsif self.player_choice == "2"
               self.game = Game.new(player_1 = Players::Computer.new(choices[letter]), player_2 = Players::Human.new(letter))
            else
              self.player_choice = nil
              select_player
            end
          else
            select_game
          end

        when "3"
          puts "You will be playing against another person."
          choices = {"X" => "O", "O" => "X"}
          select_letter
            if self.letter == "X" || self.letter == "O"
            select_player
              if self.player_choice == "1"
                 self.game = Game.new(player_1 = Players::Human.new(letter), player_2 = Players::Human.new(choices[letter]))
              elsif self.player_choice == "2"
                 self.game = Game.new(player_1 = Players::Human.new(choices[letter]), player_2 = Players::Human.new(letter))
              else
                self.player_choice = nil
                select_player
              end
            else
              select_game
            end
        else
          game_selection_menu
        end
      end

      def again_or_exit
        puts "Would you like to play another game or exit?  Choose an option by typing the corresponding number and press Enter."
        puts "  1.  Play another game."
        puts "  2.  Exit."
        input = gets.chomp
        case input
        when "1"
          CommandLineInterface.new.run
        when "2"
          exit
        else
          again_or_exit
        end
      end
end
