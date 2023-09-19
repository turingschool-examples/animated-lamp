class AmusementPark < ApplicationRecord
  has_many :rides
  has_many :mechanics, through: :rides

  def all_mechanics
    mechanics.distinct
  end
end