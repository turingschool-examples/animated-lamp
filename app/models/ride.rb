class Ride < ApplicationRecord
  belongs_to :amusement_park
  has_many :ride_mechanics
  has_many :mechanics, through: :ride_mechanics
  
  validates :name, presence: true
  validates :thrill_rating, numericality: true
  validates :open, inclusion: [true, false]
end