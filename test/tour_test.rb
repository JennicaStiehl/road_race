require './test/test_helper'
require './lib/race'
require './lib/team'
require './lib/racer'
require './lib/tour'

class TourTest < Minitest::Test

  def test_it_exists
    salida_omnium = Tour.new("Salida Omnium")

    assert_instance_of Tour, salida_omnium
  end

  def test_it_has_attributes
    salida_omnium = Tour.new("Salida Omnium")

    assert_equal 0, salida_omnium.num_races
    assert_equal 0, salida_omnium.total_revenue
  end

  def test_it_starts_without_races
    salida_omnium = Tour.new("Salida Omnium")

    assert_equal [], salida_omnium.races
  end

  def test_it_can_add_race_specifics
    salida_omnium = Tour.new("Salida Omnium")
    salida_crit = Race.new("Salida Criterium", "SW 3", 25, 5, 1, 10)
    salida_tt = Race.new("Salida Time Trial", "SW 3", 25, 5, 1.5)
    salida_rr = Race.new("Salida Road Race", "SW 3", 25, 10, 5.7, 5)

    salida_omnium.add_race(salida_crit)
    salida_omnium.add_race(salida_tt)
    salida_omnium.add_race(salida_rr)
    expected = [salida_crit, salida_tt, salida_rr]
    assert_equal expected, salida_omnium.races
    assert_equal 3, salida_omnium.num_races
  end

  def test_it_can_calc_total_miles
    salida_omnium = Tour.new("Salida Omnium")
    salida_crit = Race.new("Salida Criterium", "SW 3", 25, 5, 1, 10)
    salida_tt = Race.new("Salida Time Trial", "SW 3", 25, 5, 1.5)
    salida_rr = Race.new("Salida Road Race", "SW 3", 25, 10, 5.7, 5)
    salida_omnium.add_race(salida_crit)
    salida_omnium.add_race(salida_tt)
    salida_omnium.add_race(salida_rr)

    assert_equal 40.0, salida_omnium.total_miles
  end

end
