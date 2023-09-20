class AmusementPark < ApplicationRecord
  has_many :rides
  has_many :mechanic_rides, through: :rides
  has_many :mechanics, through: :mechanic_rides

  def hired_mechanics
    mechanics.distinct
  end

  # def rides_by_avg_experience
  #   I was trying to join merchants to @six_flags.rides, average(merchants.years_experience) AS avg_mech_experience, and order by avg_mech_experience but couldn't get it working in time
  # end
end