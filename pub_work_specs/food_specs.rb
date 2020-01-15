require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../pub_work.rb')
require_relative('../customer.rb')
require_relative('../drink.rb')
require_relative('../food.rb')



class FoodTest < MiniTest::Test

  def setup()

    @drink1 = Drink.new("beer", 4, 4)
    @drink2 = Drink.new("wine", 5, 15)
    @drink3 = Drink.new("spirit", 4, 37)
    @drinks = [@drink1, @drink2, @drink3]

    @pub = Pub.new("The Golden Trumpet", 100, @drinks)

    @customer = Customer.new("Keith", 20, 46)
    @customer2 = Customer.new('Danny', 10, 17)
    @customer3 = Customer.new('Gerry', 100, 60)

    @customer3.increase_drunkness(@drink3)
  end





end
