require './test/test_helper'
require './lib/racer'

class RacerTest < Minitest::Test

  def test_it_exists
    jennica = Racer.new("Jennica", "SW 3", 150)

    assert_instance_of Racer, jennica
  end

  def test_it_has_attributes
    jennica = Racer.new("Jennica", "SW 3", 150)

    assert_equal "Jennica", jennica.name
    assert_equal "SW 3", jennica.category
    assert_equal 150, jennica.funds
  end

  def test_it_starts_with_zero_points
    jennica = Racer.new("Jennica", "SW 3", 150)

    assert_equal 0, jennica.points
  end

  # def test_it_can_add_racing_specialties
  #   jennica = Racer.new("Jennica", "SW 3", 150)
  #   jennica.add_specialty("road")
  #   jennica.add_specialty("mountain")
  #
  #   assert_equal ["road", "mountain"], jennica.specialties
  # end

  # def test_it_can_win_cash
  #   jennica = Racer.new("Jennica", "SW 3", 150)
  #   jennica.win_cash(25)
  #
  #   assert_equal 175, jennica.funds
  # end
  #
  # def test_it_can_win_points
  #   jennica = Racer.new("Jennica", "SW 3", 150)
  #   jennica.win_points(4)
  #
  #   assert_equal 4, jennica.points
  # end

end
