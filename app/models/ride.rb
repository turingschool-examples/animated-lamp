class Ride < ApplicationRecord
  belongs_to :amusement_park
  has_many :mechanic_rides
  has_many :mechanics, through: :mechanic_rides

  validates :name, presence: true
  validates :thrill_rating, presence: true
  validates :open, inclusion: [true, false]
end