require_relative 'test_helper'
require './lib/player'
require './lib/turn'
require './lib/pin'
require './lib/ball'
require './lib/message'

class TurnTest < Minitest::Test
  include Message

  def setup
    @turn = Turn.new
  end

  def test_it_exist
    assert_instance_of Turn, @turn
  end

  def test_it_starts_and_generates_balls
    # skip
    assert_equal 0, @turn.player.balls.size
    @turn.start_phase(4)
    assert_equal 4, @turn.player.balls.length
  end

  def test_it_can_format_user_guess
    # skip
    @turn.guess('rRgy', 0)
    assert_equal 'rrgy', @turn.sanitized
  end

  def test_it_can_check_if_the_characters_are_correct
    assert_equal true, @turn.correct_characters?(Player::EASY, 'rrrr')
    assert_equal false, @turn.correct_characters?(Player::EASY, 'rrrx')
  end

  def test_it_knows_when_a_guess_has_bad_inputs
    @turn.player.set_answer('rrrr')
    assert_equal user_error_msgs[:bad_inputs], @turn.guess('rrrx', 0)
  end

  def test_it_knows_when_a_guess_has_too_many_characters
    @turn.player.set_answer('rrrr')
    assert_equal user_error_msgs[:greater], @turn.guess('rrrrr', 0)
  end

  def test_it_knows_when_a_guess_has_too_few_characters
    @turn.player.set_answer('rrrr')
    assert_equal user_error_msgs[:less], @turn.guess('rrr', 0)
  end

  def test_it_knows_when_a_input_is_decent
    @turn.player.set_answer('rrrr')
    answer = turn_result('rrrr', [4,4], 0)
    assert_equal answer, @turn.guess('rrrr', 0)
    assert_equal [4,4], @turn.pin_results
    @turn.clear_pins
    assert_equal [0,0], @turn.pin_results
  end

  def test_it_can_display_pin_results
    @turn.player.set_answer('rrrr')
    @turn.guess('rrrr', 0)
    assert_equal [4,4], @turn.pin_results
  end

  def test_it_can_clear_pins
    @turn.player.set_answer('rrrr')
    @turn.guess('rrrr', 0)
    assert_equal [4,4], @turn.pin_results
    assert_equal [], @turn.clear_pins
  end

  def test_it_can_cheat
    @turn.player.set_answer('rrrr')
    assert_equal 'rrrr', @turn.cheat
  end

  def test_it_can_guess_an_intermediate_turn
    @turn.player.set_answer('oooooo')
    answer = turn_result('oooooo', [6,6], 0)
    assert_equal answer, @turn.guess('oooooo', 0, 6)
  end

  def test_it_can_guess_an_advanced_turn
    @turn.player.set_answer('oooooomm')
    answer = turn_result('oooooomm', [8,8], 0)
    assert_equal answer, @turn.guess('oooooomm', 0, 8)
  end

  def test_it_knows_when_the_player_has_won
    @turn.player.set_answer('oooooomm')
    answer = turn_result('oooooomm', [8,8], 0)
    assert_equal answer, @turn.guess('oooooomm', 0, 8)
    assert_equal true, @turn.win?(8)
  end
end
