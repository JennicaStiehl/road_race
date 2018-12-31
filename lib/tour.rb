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
    @num_races = @races.size
  end

  def total_revenue
    @races.each do |race|
      @total_revenue += race.revenue
    end
    @total_revenue
  end

  def total_miles
    @races.inject(0) do |total, race|
      total += (race.miles * race.laps)
    end
  end

  def points_awarded
    points = {}
    @races.each do |race|
      race.teams.each do |team|
        team.members.inject(0) do |total, member|
          points[team.name] = total + member.points
        end
      end
    end
    points
  end

end
