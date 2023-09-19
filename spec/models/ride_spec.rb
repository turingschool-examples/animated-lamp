require "rails_helper"

RSpec.describe Ride, type: :model do
  describe "relationships" do
    it { should belong_to(:amusement_park) }
    it { should have_many(:mechanic_rides) }
    it { should have_many(:mechanics).through(:mechanic_rides) }
  end

  it "can list rides with the average experience of mechanics on each ride" do
    sixflags = AmusementPark.create!(name: "Six Flags", admission_cost: 314)

    dave = Mechanic.create!(name: "Dave", years_of_experience: 22)
    ethan = Mechanic.create!(name: "Ethan", years_of_experience: 52)
    frank = Mechanic.create!(name: "Frank", years_of_experience: 25)

    swing = Ride.create!(name: "Swing", thrill_rating: 1, open: false, amusement_park: sixflags)
    coaster = Ride.create!(name: "Coaster", thrill_rating: 5, open: false, amusement_park: sixflags)
    drop = Ride.create!(name: "Drop", thrill_rating: 6, open: false, amusement_park: sixflags)
    spin = Ride.create!(name: "Spin", thrill_rating: 6, open: false, amusement_park: sixflags)
    bump = Ride.create!(name: "Bump", thrill_rating: 6, open: false, amusement_park: sixflags)

    MechanicRide.create!(mechanic: dave, ride: swing)
    MechanicRide.create!(mechanic: dave, ride: coaster)
    MechanicRide.create!(mechanic: dave, ride: drop)
    MechanicRide.create!(mechanic: ethan, ride: drop)
    MechanicRide.create!(mechanic: ethan, ride: spin)
    MechanicRide.create!(mechanic: ethan, ride: bump)
    MechanicRide.create!(mechanic: frank, ride: bump)

    expect(bump.mechanic_avg_exp).to eq(38.5)
  end
end