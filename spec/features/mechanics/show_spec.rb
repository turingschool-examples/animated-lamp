require 'rails_helper'

RSpec.describe "the Mechanics show page", type: :feature do
  describe "As a user" do
    describe "When I visit /mechanic/:id" do
      before :each do
        @park = AmusementPark.create!(name: "Adventure Park", admission_cost: 20)
        @mechanic = Mechanic.create!(name: "John Smith", years_experience: 20)
        @ride1 = Ride.create!(name: "Twister", thrill_rating: 3, open: true, amusement_park_id: @park.id)
        @ride2 = Ride.create!(name: "Coaster", thrill_rating: 5, open: false, amusement_park_id: @park.id)
        @ride3 = Ride.create!(name: "Sweeper", thrill_rating: 4, open: false, amusement_park_id: @park.id)
        RideMechanic.create!(ride: @ride1, mechanic: @mechanic)
        RideMechanic.create!(ride: @ride2, mechanic: @mechanic)

        visit mechanic_path(@mechanic)
      end

      it "I see their name, years of experience, and the names of all rides they are working on" do

        expect(page).to have_content(@mechanic.name)
        expect(page).to have_content(@mechanic.years_experience)

        within("#rides") do
          expect(page).to have_content(@ride1.name)
          expect(page).to have_content(@ride2.name)
        end
      end

      it "I see a form to add a ride to their workload, after filling it in, I am returned to the show page, and see the name among the other rides" do
  
        select "#{@ride3.id}", from: "Select Ride ID"
        click_button "Submit"

        expect(current_path).to eq(mechanic_path(@mechanic))
save_and_open_page
        within("#rides") do
          expect(page).to have_content(@ride1.name)
          expect(page).to have_content(@ride2.name)
          expect(page).to have_content(@ride3.name)
        end
      end
    end
  end
end