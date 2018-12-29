class Event < ApplicationRecord
  enum type: [:debit, :credit, :reset, :budget_reset]
  belongs_to :budget_group
  belongs_to :budget, optional: true
end
