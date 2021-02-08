require_relative 'test_helper'
require './lib/ball'

class BallTest < Minitest::Test
  def test_it_exists
    ball = Ball.new('r')
    assert_instance_of Ball, ball
  end

  def test_has_attributes
    ball = Ball.new('r')
    assert_equal 'r', ball.color
  end
end
