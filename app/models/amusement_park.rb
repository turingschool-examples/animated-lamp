class AmusementPark < ApplicationRecord
  has_many :rides
  has_many :mechanics, through: :rides

  def current_mechanics
    mechanics.select("mechanics.*").distinct
  end

  def rides_with_average_mechanic_years
    self.rides.select("rides.*, AVG(Round(mechanics.years_experience))")
      .joins(:mechanics) 
      .group("rides.id")
      .order("avg desc")
  end
end