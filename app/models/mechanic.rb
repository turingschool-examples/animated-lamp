class Mechanic < ApplicationRecord
  has_many :ride_mechanics
  has_many :rides, through: :ride_mechanics

  def working_ride_list
    rides.pluck(:name)
  end
end