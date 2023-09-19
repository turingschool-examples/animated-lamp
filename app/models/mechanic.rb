class Mechanic < ApplicationRecord
  has_many :ride_mechanics
  has_many :rides, through: :ride_mechanics

  def add_ride(ride_id)
    self.rides << Ride.find(ride_id)
  end
end
