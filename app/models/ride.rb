class Ride < ApplicationRecord
  belongs_to :amusement_park
  has_many :mechanics_rides
  has_many :mechanics, through: :mechanics_rides

  validates :name, presence: true
  validates :thrill_rating, presence: true

end