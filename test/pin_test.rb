require_relative 'test_helper'
require './lib/pin'

class PinTest < Minitest::Test
  def test_it_exits
    pin = Pin.new(:correct_position)
    assert_instance_of Pin, pin
  end
end
