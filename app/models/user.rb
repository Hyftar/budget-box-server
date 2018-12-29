class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :lockable, :timeoutable,
         :trackable, :confirmable

  validates :name, uniqueness: { case_sensitive: false }
  validates :name, length: { in: 2..15 }
end
