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
    # @answer = @turn.player.set_answer('rrrr')
  end

  def test_it_exist
    assert_instance_of Turn, @turn
  end

  def test_it_starts_and_generates_balls
    # skip
    assert_equal 0, @turn.player.balls.size

    @turn.start_phase

    assert_equal 4, @turn.player.balls.length
  end

  def test_it_can_format_user_guess
    # skip
    @turn.guess('rRgy')

    assert_equal 'rrgy', @turn.sanitized
  end

  def test_it_can_check_if_the_characters_are_correct
    assert_equal true, @turn.correct_characters?('rrrr')
    assert_equal false, @turn.correct_characters?('rrrx')
  end

  def test_it_knows_when_a_guess_has_bad_inputs
    @turn.player.set_answer('rrrr')
    assert_equal user_error_msgs[:bad_inputs], @turn.guess('rrrx')
  end

  def test_it_knows_when_a_guess_has_too_many_characters
    @turn.player.set_answer('rrrr')
    assert_equal user_error_msgs[:greater4], @turn.guess('rrrrr')
  end

  def test_it_knows_when_a_guess_has_too_few_characters
    @turn.player.set_answer('rrrr')
    assert_equal user_error_msgs[:less4], @turn.guess('rrr')
  end

  def test_it_knows_when_a_input_is_decent
    @turn.player.set_answer('rrrr')
    answer = turn_result('rrrr', [4,4], 0)
    assert_equal answer, @turn.guess('rrrr')
    assert_equal [4,4], @turn.pin_results
    @turn.clear_pins
    assert_equal [0,0], @turn.pin_results
  end

  def test_it_can_cheat
    @turn.player.set_answer('rrrr')
    assert_equal 'rrrr', @turn.cheat
  end

end
