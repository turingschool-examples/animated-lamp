class Ride < ApplicationRecord
  belongs_to :amusement_park
  has_and_belongs_to_many :mechanics
end