class RideMechanic < ApplicationRecord
  belongs_to :rides
  belongs_to :mechanics
end