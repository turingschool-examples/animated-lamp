class AmusementPark < ApplicationRecord
  has_many :rides

  def unique_mechanics
    Mechanic.joins(:ride_mechanics)
    .joins(:rides)
    .where('rides.amusement_park_id = ?', self.id)
    .distinct
  end
end