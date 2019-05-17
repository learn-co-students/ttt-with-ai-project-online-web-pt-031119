class CommandLineInterface

  def run
    game_selection_menu
    Game.play
  end

  def game_selection_menu
    puts "Hello and welcome to the CLI Tic Tac Toe game!"
    puts "Please choose which type of game you would like to play:"
    puts "  1.  0 Player - Computer vs Computer"
    puts "  2.  1 Player - You vs Computer"
    puts "  3.  2 Player - Person vs Person"
    select_game
  end

  def select_letter
    puts "Which letter would you like to be, X or O? Type X or O and press Enter."
  end

  def select_player
    puts "And which player would you like to be? Type 1 or 2"
    puts "  1. Player 1 (goes first)"
    puts "  2. Player 2 (goes second)"
  end


  def select_game
    input = gets.chomp
      case game_choice

        when input == "1"
          puts "This is a game between two computer players and no input from you is required."
          Game.new(player_1=Players::Computer.new("X"), player_2=Players::Computer.new("O"))

        when input == "2"
          puts "You will be playing against the computer."
          choices = {"X" => "O", "O" => "X"}
          select_letter
          letter = gets.chomp
          if letter == "X" || letter == "O"
            select_player
            player = gets.chomp
            if player = "1"
               Game.new(player_1 = Players::Human.new(letter), player_2 = Players::Computer.new(choices[letter]))
            elsif player = "2"
               Game.new(player_1 = Players::Computer.new(choices[letter]), player_2 = Players::Human.new(letter))
            else
              select_player
            end
          else
            select_letter
          end

        when input == "3"
          puts "You will be playing against another person."
          choices = {"X" => "O", "O" => "X"}
          select_letter
          letter = gets.chomp
          if letter == "X" || letter == "O"
            select_player
            player = gets.chomp
            if player = "1"
               Game.new(player_1 = Players::Human.new(letter), player_2 = Players::Human.new(choices[letter]))
            elsif player = "2"
               Game.new(player_1 = Players::Human.new(choices[letter]), player_2 = Players::Human.new(letter))
            else
              select_player
            end
          else
            select_letter
          end
        else
          game_selection_menu
        end
end
