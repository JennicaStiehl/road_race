class Team
  attr_reader   :name
  attr_accessor :members

  def initialize(name)
    @name = name
    @members = []
  end

  def add_member(member)
    @members << member
  end

end
