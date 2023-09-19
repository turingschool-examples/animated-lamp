require "rails_helper"

RSpec.describe AmusementPark, type: :model do
  describe "relationships" do
    it { should have_many(:rides) }
    it { should have_many(:mechanics).through(:rides) }
  end
  describe "#mechanic_names" do
    before :each do
      @park_1 = AmusementPark.create!(name: "Diznee", admission_cost: 150) 
      @mechanic_1 = Mechanic.create!(name: "Fred Flintstone", years_experience: 5)
      @mechanic_2 = Mechanic.create!(name: "Sarah Silverwrench", years_experience: 7)
      @mechanic_3 = Mechanic.create!(name: "Fran Fixit", years_experience: 2)
      @mechanic_4 = Mechanic.create!(name: "Bob Bumble", years_experience: 1)
      @ride_1 = Ride.create!(name: 'The Hurler', thrill_rating: 7, open: true, amusement_park: @park_1) 
      @ride_2 = Ride.create!(name: 'The Scrambler', thrill_rating: 4, open: true, amusement_park: @park_1) 
      @ride_3 = Ride.create!(name: 'Ferris Wheel', thrill_rating: 7, open: false, amusement_park: @park_1) 
      @ride_mechanic_1 = RideMechanic.create!(ride: @ride_1, mechanic: @mechanic_1)
      @ride_mechanic_2 = RideMechanic.create!(ride: @ride_2, mechanic: @mechanic_2)
      @ride_mechanic_3 = RideMechanic.create!(ride: @ride_3, mechanic: @mechanic_1)
      @ride_mechanic_4 = RideMechanic.create!(ride: @ride_3, mechanic: @mechanic_2)
      @ride_mechanic_5 = RideMechanic.create!(ride: @ride_3, mechanic: @mechanic_3)
  
    end
    
    it "returns a list of unique mechanics for a given park" do
      expect(@park_1.mechanic_staff).to eq([@mechanic_1, @mechanic_2, @mechanic_3])
    end
  end
end