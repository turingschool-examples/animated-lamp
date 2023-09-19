class MechanicRide < ApplicationRecord
  validates :mechanic_id, presence: true
  validates :ride_id, presence: true

  belongs_to :mechanic
  belongs_to :ride
end