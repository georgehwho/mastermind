require_relative 'message'

class Turn
  include Message

  attr_reader :player,
              :sanitized

  def initialize()
    @player = Player.new
  end

  def start_phase(input)
    player.generate(input)
  end

  def guess(input, round, difficulty = 4)
    @sanitized = input.delete(" ").downcase
    guess_helper(round, difficulty)
  end

  def guess_helper(round, difficulty)
    if correct_characters?(player.difficulty) == false
      return user_error_msgs[:bad_inputs]
    elsif sanitized.length == difficulty
      player.check_answer(sanitized)
      return play_pins(round)
    end
    sanitized.length > difficulty ? user_error_msgs[:greater] : user_error_msgs[:less]
  end

  def correct_characters?(difficulty, input = sanitized)
    input.split('').each do |character|
      return false unless difficulty.include?(character)
    end
    true
  end

  def play_pins(round)
    turn_result(sanitized, pin_results, round)
  end

  def pin_results
    player.place_pins
  end

  def win?(difficulty)
    pin_results == [difficulty, difficulty]
  end

  def clear_pins
    player.reset_pins
  end

  def cheat
    player.list_balls.join
  end
end
