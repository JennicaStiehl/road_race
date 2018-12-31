class Race
  attr_reader   :name,
                :category,
                :cost,
                :race_points
  attr_accessor :teams,
                :cash_flow

  def initialize(name, category, cost, race_points)
    @name = name
    @category = category
    @cost = cost
    @race_points = race_points
    @teams = []
    @cash_flow = 0
  end

  def register_team(team)
    @teams << team
    collect_fees
  end

  def collect_fees
    @teams.inject(0) do |total_cash, team|
      total_cash += (team.members.count * @cost)
      @cash_flow = total_cash
    end
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

  def award_points
    results = {}
    rank_racers.each_with_index do |racer, index|
      if rank_racers.count >= 10
        points = @race_points -= index unless @race_points < 3
      else
        points = 0
      end
      results[racer.name] = points
    end
    results
  end
end
