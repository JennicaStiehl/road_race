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

  def test_it_can_calc_total_points_awarded
    salida_omnium = Tour.new("Salida Omnium")
    salida_crit = Race.new("Salida Criterium", "SW 3", 25, 5, 1, 10)
    salida_tt = Race.new("Salida Time Trial", "SW 3", 25, 5, 1.5)
    salida_rr = Race.new("Salida Road Race", "SW 3", 25, 10, 5.7, 5)
    salida_omnium.add_race(salida_crit)
    salida_omnium.add_race(salida_tt)
    salida_omnium.add_race(salida_rr)

    gs_boulder = Team.new("GS Boulder Cycling")
    jennica = Racer.new("Jennica Rodriguez", "SW 3", 200)
    jennifer = Racer.new("Jennifer Barber", "SW 3", 150)
    tasha = Racer.new("Natasha Danko", "SW 3", 500)
    gs_boulder.add_member(jennica)
    gs_boulder.add_member(jennifer)
    gs_boulder.add_member(tasha)

    rmrc = Team.new("Rocky Mountain Road Club")
    nicole = Racer.new("Nicole Bell", "SW 3", 100)
    rmrc.add_member(nicole)

    primal = Team.new("Team Primal Racing")
    rebecca = Racer.new("Rebecca Serratoni", "SW 3", 175)
    primal.add_member(rebecca)

    joy = Racer.new("Joy Erdman", "SW 3", 100)
    channa = Racer.new("Channa North-Hoffstaed", "SW 3", 100)
    julie = Racer.new("Julie Dow", "SW 3", 150)
    ambassadors = Team.new("Bike Ambassadors")
    ambassadors.add_member(joy)
    ambassadors.add_member(channa)
    ambassadors.add_member(julie)

    bike_law = Team.new("ColoBikeLaw.com")
    nancy = Racer.new("Nancy Parker", "SW 3", 600)
    tammi = Racer.new("Tammi Lake", "SW 3", 500)
    bike_law.add_member(nancy)
    bike_law.add_member(tammi)

    salida_crit.register_team(gs_boulder)
    salida_crit.register_team(rmrc)
    salida_crit.register_team(primal)
    salida_crit.register_team(ambassadors)
    salida_crit.register_team(bike_law)

    salida_tt.register_team(gs_boulder)
    salida_tt.register_team(rmrc)
    salida_tt.register_team(primal)
    salida_tt.register_team(ambassadors)
    salida_tt.register_team(bike_law)

    salida_rr.register_team(gs_boulder)
    salida_rr.register_team(rmrc)
    salida_rr.register_team(primal)
    salida_rr.register_team(ambassadors)
    salida_rr.register_team(bike_law)

    salida_rr.award_points
    salida_tt.award_points
    salida_crit.award_points

    expected = ({"GS Boulder Cycling"=>48,
                "Rocky Mountain Road Club"=>4,
                "Team Primal Racing"=>0,
                "Bike Ambassadors"=>0,
                "ColoBikeLaw.com"=>0})
    assert_equal expected, salida_omnium.points_awarded
    assert_equal 2, salida_crit.race_points
    assert_equal 2, salida_tt.race_points
    assert_equal 0, salida_rr.race_points
  end
end
