class Tour
  attr_reader   :name,
                :total_revenue,
                :num_races,
                :races

  def initialize(name)
    @name = name
    @races = []
    @num_races = 0
    @total_revenue = 0
  end

  def add_race(race)
    @races << race
    @num_races = @races.count
  end

  def total_miles
    @races.inject(0) do |total, race|
      total += (race.miles * race.laps)
    end
  end

end
