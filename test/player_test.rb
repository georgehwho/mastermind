require_relative 'test_helper'
require './lib/player'
require './lib/pin'
require './lib/ball'

class PlayerTest < Minitest::Test
  def test_it_exists
    player = Player.new
    assert_instance_of Player, player
  end

  def test_has_attributes
    player = Player.new
    assert_equal [], player.balls
    assert_equal [], player.pins
  end

  def test_can_generate_random_balls
    player = Player.new
    player.generate(4)
    assert_equal 4, player.balls.size
  end
end
