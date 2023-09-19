require 'rails_helper'

RSpec.describe "the Amusement Parks show page", type: :feature do
  describe "As a user" do
    describe "When I visit /amusement_parks/:id" do
      before :each do
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

        visit amusement_park_path(@park)
      end

      it "Then I see the name and price of admissions for that park, I see a unique list of names for all mechanics working for the park" do
        expect(page).to have_content(@park.name)
        expect(page).to have_content(@park.admission_cost)

        within("#mechanics") do
          expect(page).to have_content(@mechanic1.name, count: 1)
          expect(page).to have_content(@mechanic2.name, count: 1)
          expect(page).to have_content(@mechanic3.name, count: 1)
        end
      end

      it "Then I see a list of all the park's rides, next to them I see they are ordered by the average experience of mechanics working on them" do

        within("#rides") do
          expect(page).to have_content(@ride1.name)
          expect(page).to have_content("Average Mechanic Experience: 15.0 years")
          expect(page).to have_content(@ride3.name)
          expect(page).to have_content("Average Mechanic Experience: 13.0 years")
          expect(page).to have_content(@ride3.name)
          expect(page).to have_content("Average Mechanic Experience: 9.5 years")
        end

        expect(@park.ride_exp).to eq([@ride2, @ride1, @ride3])
      end
    end
  end
end
