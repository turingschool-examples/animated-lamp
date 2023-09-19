class Mechanic < ApplicationRecord
  has_many :mechanic_rides
  has_many :rides, through: :mechanic_rides
  has_many :amusement_parks, through: :rides

  validates :name, presence: true
  validates :years_experience, presence: true
end
