require_relative 'test_helper'
require './lib/player'
require './lib/turn'
require './lib/pin'
require './lib/ball'
require './lib/message'

class TurnTest < Minitest::Test

  def setup
    @turn = Turn.new(Message.new)
  end

  def test_it_exist
    assert_instance_of Turn, @turn
  end

  def test_it_initializes_has_generated_balls
    assert_instance_of Array, @turn.generated_balls
    assert_equal 4, @turn.generated_balls.length
  end

  def test_it_can_initalize_instance_of_message
    assert_instance_of Message, @turn.messages
  end

  def test_it_knows_current_turn
    skip
    assert_equal [0], @turn.round
  end

  def test_it_can_take_inputed_guess
    assert_equal 'rygb', @turn.user_guess
  end

  def test_inputed_guess_is_formatted_correctly
    assert_equal 'rygb', @turn.user_guess
  end
end
