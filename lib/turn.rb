require_relative 'message'

class Turn
  include Message

  attr_reader :player,
              :sanitized,
              :colors

  def initialize()
    @player = Player.new
  end

  def start_phase(input)
    player.generate(input)
  end

  def guess(input, round, difficulty = 4)
    @sanitized = input.delete(" ").downcase
    @colors = Player::EASY if difficulty == 4
    @colors = Player::INTERMEDIATE if difficulty == 6
    @colors = Player::HARD if difficulty == 8
    guess_helper(round, difficulty)
  end

  def guess_helper(round, difficulty)
    if correct_characters?(colors) == false
      user_error_msgs[:bad_inputs]
    elsif sanitized.length == difficulty
      player.check_answer(sanitized)
      play_pins(round)
    elsif sanitized.length > difficulty
      user_error_msgs[:greater]
    else sanitized.length < difficulty
      user_error_msgs[:less]
    end
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
