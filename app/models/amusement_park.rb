class AmusementPark < ApplicationRecord
  has_many :rides
  has_many :mechanics, through: :rides

  def unique_mechanics
    mechanics.distinct
  end

  def average_mechanic_experience_on_ride
    rides.joins(:mechanics)
    .select('rides.*, AVG(mechanics.years_experience) AS average_mechanic_experience')
    .group('rides.id')
    .order('average_mechanic_experience DESC')
  end
end