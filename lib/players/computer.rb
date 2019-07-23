module Players
  class Computer < Player

    def move(input)
      rand(1..9).to_s
    end

  end
end
