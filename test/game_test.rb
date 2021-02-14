require_relative 'test_helper'
require './lib/player'
require './lib/turn'
require './lib/pin'
require './lib/ball'
require './lib/game'

class GameTest < Minitest::Test
  def setup
    @game = Game.new
  end

  def test_it_exist
    assert_instance_of Game, @game
  end

  # I wasn't able to figure out how to test methods that interact with $stdin.
end
