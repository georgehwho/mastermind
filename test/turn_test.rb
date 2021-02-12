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
    assert_equal 0, @turn.player.balls.size
    @turn.start_phase
    assert_equal 4, @turn.player.balls.length
  end

  def test_it_can_format_user_guess
    @turn.guess('rRgy')

    assert_equal 'rrgy', @turn.sanitized
  end

  # def test_it_can_guess_correctly
  #
  #   assert_equal 'rrgy', @turn.input_guess
  # end

  def test_it_knows_current_turn
    skip
    assert_equal [0], @turn.round
  end

  def test_it_can_take_inputed_guess
    skip
    assert_equal 'rygb', @turn.user_guess
  end

  def test_inputed_guess_is_formatted_correctly
    skip
    assert_equal 'rygb', @turn.user_guess
  end
end
