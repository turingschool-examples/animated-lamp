class Mechanic < ApplicationRecord
  validates :name, presence: true
  validates :years_experience, presence: true
  
  has_many :mechanic_rides
  has_many :rides, through: :mechanic_rides

end