class Mechanic < ApplicationRecord
  has_many :ride_mechanics
  has_many :rides, through: :ride_mechanics 
  
  validates_presence_of :name, :years_experience

  def self.rides_worked_on
    joins
  end
end