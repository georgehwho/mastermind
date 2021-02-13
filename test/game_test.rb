require_relative 'test_helper'
require './lib/player'
require './lib/turn'
require './lib/pin'
require './lib/ball'
require './lib/game'

class GameTest < Minitest::Test
  def test_it_exist
    game = Game.new
    assert_instance_of Game, game
  end
end
