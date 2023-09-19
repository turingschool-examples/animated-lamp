class AmusementPark < ApplicationRecord
  has_many :rides
  has_many :mechanics, through: :rides

  def unique_mechanics
    mechanics.distinct
  end

  def average_ride_experience
    rides
    .joins(:mechanics)
    .select("rides.*, AVG(mechanics.years_experience) AS average_experience")
    .group("rides.id")
    .order("average_experience DESC")
  end
end