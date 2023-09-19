class AmusementPark < ApplicationRecord
  has_many :rides
  has_many :mechanics, through: :rides

  def uniq_mechanics
    mechanics.distinct
  end

  def order_rides_mechanic_experience
    rides.joins(:mechanics).order("rides.mechanic_avg_exp")

  end
end