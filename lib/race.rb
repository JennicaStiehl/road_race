class Race
  attr_reader   :name,
                :category,
                :cost,
                :race_points,
                :miles,
                :laps,
                :participants
  attr_accessor :teams,
                :revenue

  def initialize(name, category, cost, race_points, miles, laps = 1)
    @name = name
    @category = category
    @cost = cost
    @race_points = race_points
    @miles = miles
    @laps = laps
    @teams = []
    @revenue = 0
    @participants = []
  end

  def register_team(team)
    add_team(team)
    add_members(team)
  end

  def add_members(team)
    team.members.each do |member|
      if member.funds >= @cost
        member.funds -= @cost
        @participants << member
      end
    end
  end

  def add_team(team)
    @teams << team
  end

  def revenue
      @revenue += (@participants.size * @cost)
  end

  def valid_for_points
    @participants.size >= 10  && @race_points > 3
  end

  def award_points
    results = {}
    @participants.each_with_index do |racer, index|
      if valid_for_points
        award = @race_points -= index
        racer.points += award
      else
        racer.points += 0
      end
      results[racer.name] = racer.points
    end
    results
  end
end
