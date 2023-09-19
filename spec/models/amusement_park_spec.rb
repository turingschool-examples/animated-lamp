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
      @mechanic_3 = Mechanic.create!(name: "Chicken Mechanic", years_experience: 5)

      @park_1 = AmusementPark.create!(name: "Chicken's Park", admission_cost: 50)

      @ride_1 = Ride.create!(name: "Hiccup's Coaster", thrill_rating: 1, open: true, amusement_park_id: @park_1.id)
      @ride_2 = Ride.create!(name: "Hiccup's Teacups", thrill_rating: 10, open: false, amusement_park_id: @park_1.id)
      @ride_3 = Ride.create!(name: "Hiccup's Racing", thrill_rating: 2, open: true, amusement_park_id: @park_1.id)

      RideMechanic.create!(ride_id: @ride_1.id, mechanic_id: @mechanic_1.id)
      RideMechanic.create!(ride_id: @ride_2.id, mechanic_id: @mechanic_1.id)
      RideMechanic.create!(ride_id: @ride_1.id, mechanic_id: @mechanic_2.id)
      RideMechanic.create!(ride_id: @ride_3.id, mechanic_id: @mechanic_3.id)
    end

    describe "#unique_mechanics" do
      it "returns a list of unique mechanics for a given park" do
         expect(@park_1.unique_mechanics).to eq([@mechanic_1, @mechanic_2, @mechanic_3])
      end
    end

    describe "#average_ride_experience" do
      it "returns a list of rides for the park, sorted by average ride experience" do
        expect(@park_1.average_ride_experience).to eq([@ride_3, @ride_2, @ride_1])
        expect(@park_1.average_ride_experience.first.average_experience).to eq(5)
        expect(@park_1.average_ride_experience.last.average_experience).to eq(1.5)
      end
    end
  end
end