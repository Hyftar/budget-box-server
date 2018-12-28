class BudgetGroup < ApplicationRecord
  has_many :budget
  has_many :event
  validates :name, presence: true
end
