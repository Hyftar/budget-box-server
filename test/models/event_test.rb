require 'test_helper'

class EventTest < ActiveSupport::TestCase

  setup do
    @e = Event.new
    @e.type = "debit"
    @e.budget_group = budget_groups(:budget_group_one)
    @e.budget = budgets(:budget_one)
  end

  test "should create" do
    assert @e.save, "Should save when all field are completed"

    @e.budget = nil
    assert @e.save, "Should save when no budget are given"
  end

  test "should only accept certain type" do
    @e.type = "credit"
    assert @e.save, "Credit type should work"
    @e.type = "reset"
    assert @e.save, "Reset type should work"
    @e.type = "budget_reset"
    assert @e.save, "Budget_Reset type should work"

    assert_raise(ArgumentError, "Any other string should not work" ) {@e.type = "anything else"}
  end
end
