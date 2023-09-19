class AmusementPark < ApplicationRecord
  has_many :rides
  has_many :mechanics, through: :rides

  def mechanic_names
    mechanics.distinct.pluck(:name)
  end
end