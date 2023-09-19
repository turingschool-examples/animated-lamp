class AmusementPark < ApplicationRecord
  has_many :rides
  has_many :mechanics, through: :rides

  def mechanic_names
    mechanics.distinct
  end
end