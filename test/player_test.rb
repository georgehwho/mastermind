require_relative 'test_helper'
require './lib/player'
require './lib/pin'
require './lib/ball'

class PlayerTest < Minitest::Test
  def setup
    @player = Player.new
  end

  def test_it_exists
    assert_instance_of Player, @player
  end

  def test_has_attributes
    assert_equal [], @player.balls
    assert_equal [], @player.pins
  end

  def test_it_can_set_the_difficulty_to_easy
    @player.difficulty_setter(4)

    assert_equal Player::EASY, @player.difficulty
  end

  def test_it_can_set_the_difficulty_to_intermediate
    @player.difficulty_setter(6)

    assert_equal Player::INTERMEDIATE, @player.difficulty
  end

  def test_it_can_set_the_difficulty_to_hard
    @player.difficulty_setter(8)

    assert_equal Player::HARD, @player.difficulty
  end

  def test_it_can_add_easy_balls_to_storage
    @player.ball_generator(4)

    assert_equal 16, @player.ball_storage.size
  end

  def test_it_can_add_intermediate_balls_to_storage
    @player.ball_generator(6)

    assert_equal 30, @player.ball_storage.size
  end

  def test_it_can_add_hard_balls_to_storage
    @player.ball_generator(8)

    assert_equal 48, @player.ball_storage.size
  end

  def test_it_can_generate_four_random_balls
    @player.generate(4)

    assert_equal 4, @player.balls.size
  end

  def test_it_can_generate_six_balls
    @player.generate(6)

    assert_equal 6, @player.balls.size
  end

  def test_it_can_generate_8_balls
    @player.generate(8)

    assert_equal 8, @player.balls.size
  end

  def test_it_can_reset_balls
    @player.generate(8)

    assert_equal [], @player.reset_balls
  end
  
  def test_it_can_set_answer
    @player.set_answer("rgyb")

    assert_equal "r", @player.balls[0].color
    assert_equal "g", @player.balls[1].color
    assert_equal "y", @player.balls[2].color
    assert_equal "b", @player.balls[3].color
  end

  def test_it_can_list_balls
    player = Player.new
    player.set_answer("rgyb")

    assert_equal %w[r g y b], player.list_balls
  end

  def test_it_can_check_if_pins_are_correct
    @player.set_answer('rrrr')
    @player.check_correct_pins(%w[r r r g])

    assert_equal 3, @player.pins.size
  end

  def test_it_can_check_if_pins_are_in_position
    guess = %w[r r g g]
    @player.set_answer('rrrr')
    @player.check_correct_pins(guess)
    @player.check_pin_position(guess)

    assert_equal 2, @player.pins.size
    assert_equal true, @player.pins[0].position
    assert_equal true, @player.pins[1].position
  end

  def test_player_can_check_answer
    # skip
    @player.set_answer("gybb")
    @player.check_answer("rrrr")

    assert_equal [], @player.pins

    @player.set_answer("rgyb")
    @player.check_answer("rrrr")

    assert_equal true, @player.pins[0].correct
    assert_equal true, @player.pins[0].position
    assert_equal 1, @player.pins.size

    @player.set_answer("rgyb")
    @player.check_answer("brrr")

    assert_equal 2, @player.pins.size
    assert_equal true, @player.pins[0].correct
    assert_equal false, @player.pins[0].position
    assert_equal true, @player.pins[1].correct
    assert_equal false, @player.pins[1].position

    @player.set_answer("rgyb")
    @player.check_answer("brrb")

    assert_equal 2, @player.pins.size
    assert_equal true, @player.pins[0].correct
    assert_equal true, @player.pins[0].position
    assert_equal true, @player.pins[1].correct
    assert_equal false, @player.pins[1].position

    @player.set_answer("rrbb")
    @player.check_answer("bbrr")

    assert_equal 4, @player.pins.size
    assert_equal true, @player.pins[0].correct
    assert_equal false, @player.pins[0].position
    assert_equal true, @player.pins[1].correct
    assert_equal false, @player.pins[1].position
    assert_equal true, @player.pins[2].correct
    assert_equal false, @player.pins[2].position
    assert_equal true, @player.pins[3].correct
    assert_equal false, @player.pins[3].position

    @player.set_answer("bryb")
    @player.check_answer("brrr")

    assert_equal 2, @player.pins.size
    assert_equal true, @player.pins[0].correct
    assert_equal true, @player.pins[0].position
    assert_equal true, @player.pins[1].correct
    assert_equal true, @player.pins[1].position
  end

  def test_it_can_reset_pins
    @player.set_answer("gybb")
    @player.check_answer("rrrr")

    assert_equal [0,0], @player.place_pins
    assert_equal [], @player.reset_pins
    assert_equal [], @player.pins
  end

  def test_it_can_place_pins
    # skip
    @player.set_answer("gybb")
    @player.check_answer("rrrr")

    assert_equal [0,0], @player.place_pins
    assert_equal [], @player.reset_pins

    @player.set_answer("rgyb")
    @player.check_answer("rrrr")

    assert_equal true, @player.pins[0].correct
    assert_equal true, @player.pins[0].position
    assert_equal [1, 1], @player.place_pins
    assert_equal [], @player.reset_pins

    @player.set_answer("rgyb")
    @player.check_answer("brrr")

    assert_equal [2, 0], @player.place_pins
    assert_equal [], @player.reset_pins

    @player.set_answer("bryb")
    @player.check_answer("brrr")

    assert_equal [2, 2], @player.place_pins
  end
end
