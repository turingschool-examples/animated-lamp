class AmusementPark < ApplicationRecord
  has_many :rides
  has_many :mechanics, through: :rides

  def unique_mechanics
    mechanics.distinct
  end

  def rides_with_mech_exp 
    rides
      .joins(:mechanics)
      .select('rides.name, avg(mechanics.years_experience) as avg_exp')
      .group('rides.name')
      .order('avg_exp desc')
  end
end