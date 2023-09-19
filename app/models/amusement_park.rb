class AmusementPark < ApplicationRecord
  has_many :rides
  has_many :mechanics, through: :rides

  def find_mechanics
    AmusementPark.joins(:mechanics).where("amusement_parks.id = ?", self.id).distinct.pluck("mechanics.name")
  end

  def ride_avg_experience
    AmusementPark.joins(:mechanics).select("avg(mechanics.years_experience) AS avg_experience, rides.name AS ride_name").where("amusement_parks.id = ?", self.id).group(:ride_name).order(:avg_experience)
  end
end