class Customer

  attr_reader :name, :wallet, :belly, :age, :steaming

  def initialize(name, wallet, age)
    @name = name
    @wallet = wallet
    @belly = []
    @age = age
    @steaming = 0
  end

  def reduce_money(amount)
    @wallet -= amount
  end

  def add_to_belly(drink)
    @belly.push(drink)
  end

  def increase_drunkness(drink)
    @steaming += drink.alcohol_level
  end

  def decrease_drunkness(food)
    @steaming -= food.rejuvination_level
  end

  def age_check
    if @age >= 18
      return true
    end
    return false
  end

  def too_drunk
    if @steaming >= 20
      return false
    end
    return true
  end

  def customer_buys_drink(drink, pub)
    if age_check && too_drunk
      reduce_money(drink.price)
      pub.add_to_til(drink.price)
      add_to_belly(drink)
      increase_drunkness(drink)
    end
    return false
  end

  def customer_buys_food(food, pub)
    reduce_money(food.price)
    pub.add_to_til(food.price)
    add_to_belly(food)
    decrease_drunkness(food)
  end

end
