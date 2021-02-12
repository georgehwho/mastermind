require_relative 'message'

class Game
  include Message
  attr_reader :turn

  def initialize(turn)
    @turn = turn
  end

  def start
    game.welcome
    puts
    first_prompt
  end

  def first_prompt
    game.game_start

    input = gets.chomp.downcase
    if input == 'p'
      turn.start_phase
      game.turn_prompt
      playing
    elsif input == 'i'
      turn.instructions
      instruction_input = gets.chomp.downcase
      if instruction_input == 'q'
        break
      else
        first_prompt
      end
    elsif input == 'q'
      break
    else
      puts "you didn't answer correctly!"
      first_prompt
    end
  end

  def playing
    #   #insert game logic here
    end
  end
end
