class Pub

  attr_reader :name, :til

  def initialize(name, til, drinks, food)
    @name = name
    @til = til
    @drinks = drinks
    @food = food

  end

  def add_to_til(amount)
    return @til += amount
  end

end
