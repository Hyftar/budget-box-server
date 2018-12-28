class Budget < ApplicationRecord
  belongs_to :budget_group
  validates :color, format: { with: /\A\#(?:[0-9a-f]{6})|#(?:[0-9a-f]{3})\z/i }
  validates :name, presence: true
end
