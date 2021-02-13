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

  def guess(input, round = 0)
    @sanitized = input.delete(" ").downcase

    if correct_characters? == false
      user_error_msgs[:bad_inputs]
    elsif sanitized.length == 4
      player.check_answer(sanitized)
      play_pins(round)
    elsif sanitized.length > 4
      user_error_msgs[:greater4]
    elsif sanitized.length < 4
      user_error_msgs[:less4]
    else
      user_error_msgs[:general]
    end
  end

  def correct_characters?(input = sanitized)
    input.split('').each do |character|
      return false unless ["r", "g", "b", "y"].include?(character)
    end
    true
  end

  def play_pins(round)
    turn_result(sanitized, pin_results, round)
  end

  def pin_results
    player.place_pins
  end

  def clear_pins
    player.reset_pins
  end

  def cheat
    player.list_balls.join
  end
end
