require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../pub_work.rb')
require_relative('../customer.rb')
require_relative('../drink.rb')
require_relative('../food.rb')


class PubTest < MiniTest::Test

  def setup()

    @drink1 = Drink.new("beer", 4)
    @drink2 = Drink.new("wine", 5)
    @drink3 = Drink.new("spirit", 4)
    @drinks = [@drink1, @drink2, @drink3]

    @pub = Pub.new("The Golden Trumpet", 100, @drinks)

    @customer = Customer.new("Keith", 20, 46)
  end


def test_has_name()
  assert_equal("The Golden Trumpet", @pub.name)
end

def test_til_total
  assert_equal(100, @pub.til)
end

def test_add_to_til
  assert_equal(105, @pub.add_to_til(5))
end




  # def test_choose_drink
  #   result = @drink.choose_drink("beer")
  #   assert_equal(@drink1, result)
  # end






end
