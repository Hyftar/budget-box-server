require 'test_helper'

class BudgetTest < ActiveSupport::TestCase
  setup do
    @b = Budget.new
    @b.name = "restaurant"
    @b.color = "#000000"
    @b.initial_value = 1000.00
    @b.current_value = 100.00
    @b.budget_group = budget_groups(:budget_group_one)
  end

  test "should create" do
    assert @b.save
  end

  test "should not save without a budget_group" do
    @b.budget_group = nil
    assert_not @b.save
  end

  test "should have a color" do
    @b.color = nil
    assert_not @b.save
  end

  test "should be a valid color" do
    # Invalid colors
    @b.color = "hello world"
    assert_not @b.save, "Hello world should not be a valid color"
    @b.color = "ab2"
    assert_not @b.save, "Colors should have a '#' before hex code (length 3)"
    @b.color = "a1b2c3"
    assert_not @b.save, "Colors should have a '#' before hex code (length 6)"
    @b.color = "#GgG"
    assert_not @b.save, "Colors should only allow for letter between A through F"

    # Valid colors
    @b.color = "#Aa5"
    assert @b.save, "Colors should allow for numbers, uppercase and lowercase letters"
    @b.color = "#a1B2c3"
    assert @b.save, "Color should allow for numbers, uppercase and lowercase letters"
  end

  test "should have a name" do
    @b.name = nil
    assert_not @b.save
  end

end
