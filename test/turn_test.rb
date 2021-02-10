require_relative 'test_helper'
require './lib/player'
require './lib/turn'
require './lib/pin'
require './lib/ball'

class TurnTest < Minitest::Test

  def setup
    @turn = Turn.new(@player, @round)
    @player = Player.new(@balls, @pins)
  end

  def test_turn_exist
    assert_instance_of Turn, @turn
  end

  def test_
    assert_equal
  end












end
