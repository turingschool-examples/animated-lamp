class AmusementPark < ApplicationRecord
  has_many :rides
  has_many :mechanics, through: :rides

  validates_presence_of :name
  validates_presence_of :admission_cost
end