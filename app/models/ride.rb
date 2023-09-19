class Ride < ApplicationRecord
  belongs_to :amusement_park
  has_many :mechanic_rides
  has_many :mechanics, through: :mechanic_rides

  validates :name, presence: true
  validates :thrill_rating, presence: true
  validates :open, inclusion: [true, false]

  def avg_mechanic_experience
    # binding.pry
    # Ride.joins(:mechanics).distinct.select("avg(mechanics.years_experience) as avg_exp").where("rides.id = #{self.id}").avg_exp
    Ride.joins(:mechanics).distinct.where("rides.id = #{self.id}").average("mechanics.years_experience")
  end
end