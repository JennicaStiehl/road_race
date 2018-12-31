class Racer
  attr_reader   :name,
                :category,
                :funds,
                :points,
                :specialties

  def initialize(name, category, funds)
    @name = name
    @category = category
    @funds = funds
    @points = 0
    @specialties = []
  end

  def add_specialty(specialty)
    @specialties << specialty
  end

  def win_cash(amount)
    @funds += amount
  end

  def win_points(number_of_points)
    @points += number_of_points
  end
  
end
