class Race
  attr_reader   :name,
                :category,
                :cost,
                :race_points,
                :miles,
                :laps
  attr_accessor :teams,
                :cash_flow

  def initialize(name, category, cost, race_points, miles, laps = 1)
    @name = name
    @category = category
    @cost = cost
    @race_points = race_points
    @miles = miles
    @laps = laps
    @teams = []
    @cash_flow = 0
  end

  def register_team(team)
    collect_fees(team)
    @teams << team
    team.members.each do |member|
      member.funds -= @cost
    end
  end

  def collect_fees(team)
    total_cash = 0
      total_cash += (team.members.count * @cost)
      @cash_flow += total_cash
  end

  def rank_racers
    participants = []
    @teams.each do |team|
      team.members.sort_by do |member|
        participants << member
      end
    end
    participants
  end

  def valid_for_points
    rank_racers.count >= 10  && @race_points > 3
  end

  def award_points
    results = {}
    rank_racers.each_with_index do |racer, index|
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
