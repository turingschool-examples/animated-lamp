require "rails_helper"

RSpec.describe AmusementPark, type: :model do
  describe "relationships" do
    it { should have_many(:rides) }
    it { should have_many(:mechanics).through(:rides) }
  end

  describe "instance methods" do
    describe "#ride_exp" do
      it "orders rides by the avg experience of their mechanics, with avg as returnable column" do
        @park = AmusementPark.create!(name: "Adventure Park", admission_cost: 20)
        @mechanic1 = Mechanic.create!(name: "John Smith", years_experience: 20)
        @mechanic2 = Mechanic.create!(name: "Jane Doe", years_experience: 10)
        @mechanic3 = Mechanic.create!(name: "Janitor", years_experience: 9)
        @ride1 = Ride.create!(name: "Twister", thrill_rating: 3, open: true, amusement_park_id: @park.id)
        @ride2 = Ride.create!(name: "Coaster", thrill_rating: 5, open: false, amusement_park_id: @park.id)
        @ride3 = Ride.create!(name: "Sweeper", thrill_rating: 4, open: false, amusement_park_id: @park.id)
        RideMechanic.create!(ride: @ride1, mechanic: @mechanic1)
        RideMechanic.create!(ride: @ride2, mechanic: @mechanic1)
        RideMechanic.create!(ride: @ride1, mechanic: @mechanic2)
        RideMechanic.create!(ride: @ride2, mechanic: @mechanic2)
        RideMechanic.create!(ride: @ride3, mechanic: @mechanic2)
        RideMechanic.create!(ride: @ride1, mechanic: @mechanic3)
        RideMechanic.create!(ride: @ride3, mechanic: @mechanic3)

        expect(@park.ride_exp).to eq([@ride2, @ride1, @ride3])
        expect(@park.ride_exp.first.avg).to eq(15)
        expect(@park.ride_exp.second.avg).to eq(13)
        expect(@park.ride_exp.third.avg).to eq(9.5)
      end
    end
  end
end