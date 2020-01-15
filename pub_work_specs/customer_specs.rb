require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../pub_work.rb')
require_relative('../customer.rb')
require_relative('../drink.rb')
require_relative('../food.rb')


class CustomerTest < MiniTest::Test

  def setup()

    @drink1 = Drink.new("beer", 4, 4)
    @drink2 = Drink.new("wine", 5, 15)
    @drink3 = Drink.new("spirit", 4, 37)
    @drinks = [@drink1, @drink2, @drink3]


    @food1 = Food.new("chips", 3, 10)
    @food2 = Food.new("Kebab", 6, 20)
    @food = [@food1, @food2]

    @pub = Pub.new("The Golden Trumpet", 100, @drinks, @food)

    @customer = Customer.new("Keith", 20, 46)
    @customer2 = Customer.new('Danny', 10, 17)
    @customer3 = Customer.new('Gerry', 100, 60)

    @customer3.increase_drunkness(@drink3)
  end


  def test_return_name
    assert_equal("Keith", @customer.name)
  end

  def test_reduce_money
    assert_equal(15, @customer.reduce_money(5))
  end

  def test_add_to_belly
    assert_equal(['beer'], @customer.add_to_belly('beer'))
  end

  def test_age_check
    assert_equal(false, @customer2.age_check)
  end

  def test_increase_drunkness
    assert_equal(15, @customer.increase_drunkness(@drink2))
  end

  def test_decrease_drunkness
    assert_equal(17, @customer3.decrease_drunkness(@food2))
  end

  def test_too_drunk
    assert_equal(false, @customer3.too_drunk)
  end

  def test_customer_buys_drink
    @customer.customer_buys_drink(@drink1, @pub)
    assert_equal(16, @customer.wallet)
    assert_equal(104, @pub.til)
    assert_equal('beer', @customer.belly[0].name)
    assert_equal(4, @customer.steaming)
  end

  def test_customer_buys_drink_underage
    assert_equal(false, @customer2.customer_buys_drink(@drink2, @pub))
    assert_equal(10, @customer2.wallet)
    assert_equal(100, @pub.til)
    assert_equal([], @customer2.belly)
  end

  def test_customer_buys_drink_steamboat
    assert_equal(false, @customer3.customer_buys_drink(@drink1, @pub))
    assert_equal(100, @customer3.wallet)
    assert_equal(100, @pub.til)
    assert_equal([], @customer3.belly)
  end


  def test_customer_buys_food
    @customer.customer_buys_food(@food2, @pub)
    assert_equal(14, @customer.wallet)
    assert_equal(106, @pub.til)
    assert_equal([@food2], @customer.belly)
    assert_equal(-20, @customer.steaming)
  end

end
