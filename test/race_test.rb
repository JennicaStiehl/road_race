require './test/test_helper'
require './lib/race'
require './lib/team'
require './lib/racer'

class RaceTest < Minitest::Test

  def test_it_exists
    salida_crit = Race.new("Salida Criterium", "SW 3", 25, 5, 1, "60")

    assert_instance_of Race, salida_crit
  end

  def test_it_has_attributes
    salida_crit = Race.new("Salida Criterium", "SW 3", 25, 5, 1, "60")

    assert_equal "Salida Criterium", salida_crit.name
    assert_equal "SW 3", salida_crit.category
    assert_equal 25, salida_crit.cost
    assert_equal 5, salida_crit.race_points
    assert_equal 1, salida_crit.miles
  end

  def test_it_starts_the_day_without_participants
    salida_crit = Race.new("Salida Criterium", "SW 3", 25, 5, 1, "60")

    assert_equal [], salida_crit.teams
  end

  def test_it_can_register_racers
    salida_crit = Race.new("Salida Criterium", "SW 3", 25, 5, 1, "60")
    gs_boulder = Team.new("GS Boulder")
    jennica = Racer.new("Jennica Rodriguez", "SW 3", 200)
    ek = Racer.new("Eric Kenney", "SM 1", 150)
    luis = Racer.new("Luis Rodrigiuez", "SM 3", 200)
    jennifer = Racer.new("Jennifer Barber", "SW 3", 150)
    rmrc = Team.new("Rocky Mountain Road Club")
    nicole = Racer.new("Nicole Bell", "SW 2", 100)
    steve = Racer.new("Steve Stoley", "SM 4", 100)
    gs_boulder.add_member(jennica)
    gs_boulder.add_member(ek)
    gs_boulder.add_member(luis)
    gs_boulder.add_member(jennifer)
    rmrc.add_member(nicole)
    rmrc.add_member(steve)

    salida_crit.register_team(gs_boulder)
    salida_crit.register_team(rmrc)
    assert_equal [gs_boulder, rmrc], salida_crit.teams
  end

  def test_it_can_collect_money_from_racers
    salida_crit = Race.new("Salida Criterium", "SW 3", 25, 5, 1, "60")
    gs_boulder = Team.new("GS Boulder")
    jennica = Racer.new("Jennica Rodriguez", "SW 3", 200)
    ek = Racer.new("Eric Kenney", "SM 1", 150)
    luis = Racer.new("Luis Rodrigiuez", "SM 3", 200)
    jennifer = Racer.new("Jennifer Barber", "SW 3", 150)
    rmrc = Team.new("Rocky Mountain Road Club")
    nicole = Racer.new("Nicole Bell", "SW 2", 100)
    steve = Racer.new("Steve Stoley", "SM 4", 100)
    gs_boulder.add_member(jennica)
    gs_boulder.add_member(ek)
    gs_boulder.add_member(luis)
    gs_boulder.add_member(jennifer)
    rmrc.add_member(nicole)
    rmrc.add_member(steve)

    salida_crit.register_team(gs_boulder)
    salida_crit.register_team(rmrc)

    assert_equal 150, salida_crit.cash_flow
  end

  def test_it_does_not_award_points_when_participants_less_10
    salida_crit = Race.new("Salida Criterium", "SW 3", 25, 5, 1, "60")
    gs_boulder = Team.new("GS Boulder")
    jennica = Racer.new("Jennica Rodriguez", "SW 3", 200)
    jennifer = Racer.new("Jennifer Barber", "SW 3", 150)
    gs_boulder.add_member(jennica)
    gs_boulder.add_member(jennifer)
    rmrc = Team.new("Rocky Mountain Road Club")
    nicole = Racer.new("Nicole Bell", "SW 3", 100)
    rmrc.add_member(nicole)
    primal = Team.new("Team Primal Racing")
    rebecca = Racer.new("Rebecca Serratoni", "SW 3", 175)
    primal.add_member(rebecca)
    salida_crit.register_team(gs_boulder)
    salida_crit.register_team(rmrc)
    salida_crit.register_team(primal)

    expected = ({"Jennica Rodriguez"=>0,
                   "Jennifer Barber"=>0,
                       "Nicole Bell"=>0,
                 "Rebecca Serratoni"=>0
                 })
    assert_equal expected, salida_crit.award_points
  end

  def test_it_can_award_points
    salida_crit = Race.new("Salida Criterium", "SW 3", 25, 5, 1, "60")
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

    expected = ({"Jennica Rodriguez"=>5,
                   "Jennifer Barber"=>4,
                     "Natasha Danko"=>2,
                       "Nicole Bell"=>0,
                 "Rebecca Serratoni"=>0,
                        "Joy Erdman"=>0,
            "Channa North-Hoffstaed"=>0,
                         "Julie Dow"=>0,
                       "Nancy Parker"=>0,
                         "Tammi Lake"=>0
})
    assert_equal expected, salida_crit.award_points
  end
end
