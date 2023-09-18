class AmusementPark < ApplicationRecord
  has_many :rides
  has_many :mechanics, through: :rides

  validates :name, presence: true
  validates :admission_cost, presence: true

  def ride_mechanics
    Mechanic.joins(:amusement_parks).distinct.where("amusement_parks.id = #{self.id}")
  end
end