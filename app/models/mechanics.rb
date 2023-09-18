class Mechanics < ApplicationRecord
  has_many :ride_mechanics
  has_many :rides, through: :ride_mechanics
end