class AmusementPark < ApplicationRecord
  has_many :rides
  has_many :mechanics, through: :rides

  def ride_exp
    a = rides.select("rides.*, avg(mechanics.years_experience) as avg").joins(:mechanics).group("rides.id").order("avg desc")
    # require 'pry'; binding.pry
  end
end