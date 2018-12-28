require 'test_helper'

class BudgetGroupTest < ActiveSupport::TestCase
  setup do
    @b = BudgetGroup.new
    @b.name = "v"
    @b.initial_value = 34
    @b.current_value = 500
  end

  test "should create" do
    assert @b.save
  end

  test "should have the good Number format" do
    val = 567.67
    @b.initial_value = val
    @b.save
    assert_equal val, @b.initial_value, "should be the same"
  end

  test "should not save more than 2 digit after the comas" do
    val = 567.678
    @b.initial_value = val
    @b.save
    assert_not_in_delta val, @b.initial_value, 0.001, "should be different"
    assert_in_delta 567.68, @b.initial_value, 0.001, "should have a difference smaller than 0.001"
  end

  test "Should not save without a name" do
    @b.name = nil
    assert_not @b.save, "should not save"
  end

end
