class Ride < ApplicationRecord
  belongs_to :amusement_park
  has_many :mechanic_rides
  has_many :mechanics, through: :mechanic_rides

  def mechanic_avg_exp
    mechanics.average("mechanics.years_of_experience")
  end
end