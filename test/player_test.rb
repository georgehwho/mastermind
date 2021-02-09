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

  def test_player_can_set_answer
    player = Player.new
    player.set_answer("rgyb")

    assert_equal "r", player.balls[0].color
    assert_equal "g", player.balls[1].color
    assert_equal "y", player.balls[2].color
    assert_equal "b", player.balls[3].color
  end

  def test_player_can_check_answer
    player = Player.new
    player.set_answer("gybb")
    player.check_answer("rrrr")
    assert_equal [], player.pins

    player.set_answer("rgyb")
    player.check_answer("rrrr")
    assert_equal true, player.pins[0].correct
    assert_equal true, player.pins[0].position
    assert_equal 1, player.pins.size

    player.set_answer("rgyb")
    player.check_answer("brrr")
    assert_equal 2, player.pins.size
    assert_equal true, player.pins[0].correct
    assert_equal false, player.pins[0].position
  end

  def test_can_place_pins
    player = Player.new
    player.set_answer("gybb")
    player.check_answer("rrrr")
    assert_nil player.place_pins

    player.set_answer("rgyb")
    player.check_answer("rrrr")
    assert_equal true, player.pins[0].correct
    assert_equal true, player.pins[0].position
    assert_equal [1, 1], player.place_pins

    player.set_answer("rgyb")
    player.check_answer("brrr")
    assert_equal [2, 0], player.place_pins
  end
end
