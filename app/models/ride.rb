class Ride < ApplicationRecord
  belongs_to :amusement_park
  has_many :ride_mechanics
  has many :mechanics, through: :ride_mechanics
end