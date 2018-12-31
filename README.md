#Road Race

##Setup
* Fork this Repository
* Clone YOUR fork
* Complete the activity below
* Push your solution to your fork
* Submit a pull request from your repository to the turingschool-examples repository
* Make sure to put your name in your PR!

##Tasks
We're developing a small application to provide automation for the Bicycle Racing of Colorado (BRAC) association. Use tests to drive your development.

###Iteration 1: Creating Racers
```ruby
pry(main)> require './lib/racer'
=> true

pry(main)> jennica = Racer.new("Jennica", "SW 3", 150)
=> #<Racer:0x007f98ef480618 @category="SW 3", @funds=150, @name="Jennica", @points=0>

pry(main)> assert_equal "Jennica", jennica.name
=> true

pry(main)> assert_equal "SW 3", jennica.category
=> true
pry(main)> assert_equal 150, jennica.funds
=> true

pry(main)> assert_equal 0, jennica.points
=> true
```

###Iteration 2
```ruby
pry(main)> require './lib/racer'
=> true
pry(main)> require './lib/team'
=> true

pry(main)> gs_boulder = Team.new("GS Boulder")
=> #<Team:0x007fc406067620 @members=[], @name="GS Boulder">

pry(main)> assert_instance_of Team, gs_boulder
=> true

pry(main)> assert_equal [], gs_boulder.members
=> true
gs_boulder = Team.new("GS Boulder")
jennica = Racer.new("Jennica Rodriguez", "SW 3", 200)
ek = Racer.new("Eric Kenney", "SM 1", 150)
luis = Racer.new("Luis Rodrigiuez", "SM 3", 200)
jennifer = Racer.new("Jennifer Barber", "SW 3", 150)
gs_boulder.add_member(jennica)
gs_boulder.add_member(ek)
gs_boulder.add_member(luis)
gs_boulder.add_member(jennifer)
[1] pry(main)> assert_equal 4, gs_boulder.members.count
=> true
```
###Iteration 3

The race should be able to register racers, take their money and add it to their cash flow. Races should also be able to award points, only if there are more than 10 participants.

```ruby
pry(main)> require './lib/race'
=> true
pry(main)> require './lib/team'
=> true
pry(main)> require './lib/racer'
=> true

pry(main)> salida_crit = Race.new("Salida Criterium", "SW 3", 25, 5, 1, "60")
=> #<Race:0x007ff0aaa78f58 @cash_flow=0, @category="SW 3",@cost=25,@laps="60",@miles=1,@name="Salida Criterium",@race_points=5,@teams=[]>

pry(main)> assert_equal "Salida Criterium", salida_crit.name
=> true
[2] pry(main)> assert_equal "SW 3", salida_crit.category
=> true
[3] pry(main)> assert_equal 25, salida_crit.cost
=> true
[4] pry(main)> assert_equal 5, salida_crit.race_points
=> true
[5] pry(main)> assert_equal 1, salida_crit.miles
=> true

pry(main)> assert_equal [], salida_crit.teams
=> true
```

###Iteration 4
Tour
A tour should be able to add races, calculate revenue for all of it's races and it's total miles. A tour should also know and be able to report how many points each team has been awarded.
