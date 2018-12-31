require './test/test_helper'
require './lib/racer'
require './lib/team'

class TeamTest < Minitest::Test

  def test_it_exists
    gs_boulder = Team.new("GS Boulder")

    assert_instance_of Team, gs_boulder
  end

  def test_it_starts_without_members
    gs_boulder = Team.new("GS Boulder")

    assert_equal [], gs_boulder.members
  end

  def test_it_can_add_members
    gs_boulder = Team.new("GS Boulder")
    jennica = Racer.new("Jennica Rodriguez", "SW 3", 200)
    ek = Racer.new("Eric Kenney", "SM 1", 150)
    luis = Racer.new("Luis Rodrigiuez", "SM 3", 200)
    jennifer = Racer.new("Jennifer Barber", "SW 3", 150)
    gs_boulder.add_member(jennica)
    gs_boulder.add_member(ek)
    gs_boulder.add_member(luis)
    gs_boulder.add_member(jennifer)

    assert_equal 4, gs_boulder.members.count
  end
end
