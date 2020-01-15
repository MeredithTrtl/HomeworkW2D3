require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../pub_work.rb')
require_relative('../customer.rb')
require_relative('../drink.rb')
require_relative('../food.rb')


class DrinkTest < MiniTest::Test

  def setup

    @drink1 = Drink.new("beer", 4)
    @drink2 = Drink.new("wine", 5)
    @drink3 = Drink.new("spirit", 4.50)

    @pub = Pub.new("The Golden Trumpet", 100, [@drink1, @drink2, @drink3])

    @customer = Customer.new("Keith", 20, 46)
  end

def test_return_bev
  assert_equal("beer", @drink1.name)
end


end
