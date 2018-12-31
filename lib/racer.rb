class Racer
  attr_reader   :name,
                :category
  attr_accessor :points,
                :funds

  def initialize(name, category, funds)
    @name = name
    @category = category
    @funds = funds
    @points = 0
  end

  # def win_cash(amount)
  #   @funds += amount
  # end
  #
  # def win_points(number_of_points)
  #   @points += number_of_points
  # end

end
