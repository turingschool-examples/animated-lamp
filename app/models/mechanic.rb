class Mechanic < ApplicationRecord
  has_many :ride_mechanics
  has many :rides, through: :ride_mechanics
end
