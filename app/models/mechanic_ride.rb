class MechanicRide < ApplicationRecord
  belongs_to :mechanics
  belongs_to :rides
end