class AmusementPark < ApplicationRecord
  has_many :rides
  has_many :ride_mechanics, through: :rides
  has_many :mechanics, through: :ride_mechanics

 def park_mechanics
  self.mechanics.select(:name).distinct
 end
end