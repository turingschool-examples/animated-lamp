class AmusementPark < ApplicationRecord
  has_many :rides
  has_many :mechanics, through: :rides

  def find_mechanics
    AmusementPark.joins(:mechanics).where("amusement_parks.id = ?", self.id).distinct.pluck("mechanics.name")
  end
end