require "rails_helper"

RSpec.describe AmusementPark, type: :model do
  describe "relationships" do
    it { should have_many(:rides) }
    it { should have_many(:mechanics).through(:rides) }
  end

  describe "instance methods" do
    before(:each) do
      @mechanic_1 = Mechanic.create!(name: "Kiwi Mechanic", years_experience: 2)
      @mechanic_2 = Mechanic.create!(name: "Coco Mechanic", years_experience: 1)

      @park_1 = AmusementPark.create!(name: "Chicken's Park", admission_cost: 50)

      @ride_1 = Ride.create!(name: "Hiccup's Coaster", thrill_rating: 1, open: true, amusement_park_id: @park_1.id)
      @ride_2 = Ride.create!(name: "Hiccup's Teacups", thrill_rating: 10, open: false, amusement_park_id: @park_1.id)

      RideMechanic.create!(ride_id: @ride_1.id, mechanic_id: @mechanic_1.id)
      RideMechanic.create!(ride_id: @ride_2.id, mechanic_id: @mechanic_1.id)
      RideMechanic.create!(ride_id: @ride_1.id, mechanic_id: @mechanic_2.id)
    end

    describe "#unique_mechanics" do
      it "returns a list of unique mechanics for a given park" do
         expect(@park_1.unique_mechanics).to eq([@mechanic_1, @mechanic_2])
      end
    end
  end
end