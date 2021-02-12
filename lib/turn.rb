require_relative 'message'

class Turn
  include Message

  attr_reader :player,
              :sanitized

  def initialize()
    @player = Player.new
  end

  def start_phase
    player.generate(4)
  end

  def guess(input)
    @sanitized = input.delete(" ").downcase
    until sanitized.length == 4 && incorrect_characters?
      player.check_answer(sanitized)
      # play_pins
    end

    if sanitized.length > 4
      user_error_msgs[:greater4]
    elsif sanitized.length < 4
      user_error_msgs[:less4]
    else
      user_error_msgs[:general]
    end
  end

  def play_pins
    # turn_result
  end

  def incorrect_characters?
    sanitized.each do |character|
      %w[r g y b].include?(character) ? true : puts "You didn't input the correct characters"
    end
  end



  # guess

  # comparison of guess to generated code
  #
  # response to that guess via pins

  # Need instance of player in turn because turn needs to use methods in player
end
