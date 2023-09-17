require "rails_helper"

RSpec.describe AmusementPark, type: :model do
  describe "relationships" do
    it { should have_many(:rides) }
    it { should have_many(:mechanics).through(:rides) }
  end

  describe "#find_mechanics" do
    it "should return a distinct list of mechanics working on the parks rides" do
      amusement_park_1 = AmusementPark.create!(
        name: "Fun World",
        admission_cost: 75
      )
      
      ride_1 = amusement_park_1.rides.create!(
        name: "Twisty Turny",
        thrill_rating: 8,
        open: true
      )

      ride_2 = amusement_park_1.rides.create!(
        name: "Slowy Slide",
        thrill_rating: 3,
        open: true
      )

      ride_3 = amusement_park_1.rides.create!(
        name: "Funny Fun Time",
        thrill_rating: 5,
        open: true
      )

      mechanic_1 = Mechanic.create!(
        name: "Frank Fixes",
        years_experience: 12
      )

      mechanic_2 = Mechanic.create!(
        name: "Abby Awesome",
        years_experience: 2
      )

      RideMechanic.create!(mechanic: mechanic_1, ride: ride_1)
      RideMechanic.create!(mechanic: mechanic_1, ride: ride_2)
      RideMechanic.create!(mechanic: mechanic_2, ride: ride_2)
      RideMechanic.create!(mechanic: mechanic_2, ride: ride_3)

      expect(amusement_park_1.find_mechanics).to eq(["#{mechanic_1.name}", "#{mechanic_2.name}"].sort)
    end
  end

  describe "#ride_avg_experience" do
    it "returns the average years of experience for an amusement park's rides mechanic's in order of experience" do
      amusement_park_1 = AmusementPark.create!(
        name: "Fun World",
        admission_cost: 75
      )
      
      ride_1 = amusement_park_1.rides.create!(
        name: "Twisty Turny",
        thrill_rating: 8,
        open: true
      )

      ride_2 = amusement_park_1.rides.create!(
        name: "Slowy Slide",
        thrill_rating: 3,
        open: true
      )

      mechanic_1 = Mechanic.create!(
        name: "Frank Fixes",
        years_experience: 12
      )

      mechanic_2 = Mechanic.create!(
        name: "Abby Awesome",
        years_experience: 2
      )

      mechanic_3 = Mechanic.create!(
        name: "Eliza Engineer",
        years_experience: 25
      )

      mechanic_4 = Mechanic.create!(
        name: "Bob Builder",
        years_experience: 40
      )

      RideMechanic.create!(ride: ride_1, mechanic: mechanic_1)
      RideMechanic.create!(ride: ride_1, mechanic: mechanic_2)
      RideMechanic.create!(ride: ride_2, mechanic: mechanic_3)
      RideMechanic.create!(ride: ride_2, mechanic: mechanic_4)

      rides = amusement_park_1.ride_avg_experience
      
      expect(rides[0].ride_name).to eq("#{ride_1.name}")
      expect(rides[1].ride_name).to eq("#{ride_2.name}")
      expect(rides[0].avg_experience).to eq(7.0)
      expect(rides[1].avg_experience).to eq(32.5)
    end
  end
end