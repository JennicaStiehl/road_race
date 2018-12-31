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


end
