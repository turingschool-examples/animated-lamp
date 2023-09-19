class AmusementPark < ApplicationRecord
  has_many :rides

  validates :name, presence: true
  validates :admission_cost, presence: true
end
