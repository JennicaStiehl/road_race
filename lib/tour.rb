class Tour
  attr_reader   :name,
                :num_races,
                :total_revenue,
                :races

  def initialize(name, num_races)
    @name = name
    @num_races = num_races
    @total_revenue = 0
    @races = []
  end

  def add_race(race)
    @races << race
  end

end
