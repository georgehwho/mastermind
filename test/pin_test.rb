require_relative 'test_helper'
require './lib/pin'

class PinTest < Minitest::Test
  def test_it_exists
    pin = Pin.new()
    assert_instance_of Pin, pin
  end

  def test_has_accessible_attributes
    pin = Pin.new()
    assert_equal false, pin.position
    assert_equal false, pin.correct
  end

  def test_just_correct_works
    pin = Pin.new()
    pin.only_correct
    assert_equal false, pin.position
    assert_equal true, pin.correct
  end

  def test_both_correct_works
    pin = Pin.new()
    pin.both_correct
    assert_equal true, pin.position
    assert_equal true, pin.correct
  end
end
