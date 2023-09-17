class AmusementPark < ApplicationRecord
  has_many :rides
  has_many :mechanics, through: :rides

  def current_mechanics
    mechanics.select("mechanics.*").distinct
  end
end