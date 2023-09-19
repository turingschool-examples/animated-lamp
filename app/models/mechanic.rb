class Mechanic < ApplicationRecord
  has_many :mechanics_rides
  has_many :rides, through: :mechanics_rides

  validates :name, presence: true
  validates :years_experience, presence: true
end