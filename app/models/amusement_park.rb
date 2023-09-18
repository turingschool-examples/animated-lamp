class AmusementPark < ApplicationRecord
  has_many :rides
  has_many :mechanics, through: :rides

  validates :name, presence: true
  validates :admission_cost, presence: true
end