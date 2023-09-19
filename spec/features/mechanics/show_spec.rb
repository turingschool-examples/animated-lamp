require 'rails_helper'

RSpec.describe "the Mechanics show page", type: :feature do
  describe "As a user" do
    describe "When I visit /mechanic/:id" do
      it "I see their name, years of experience, and the names of all rides they are working on" do
        park = AmusementPark.create!(name: "Adventure Park", admission_cost: 20)
        mechanic = Mechanic.create!(name: "John Smith", years_experience: 20)
        ride1 = Ride.create!(name: "Twister", thrill_rating: 3, open: true, amusement_park_id: park.id)
        ride2 = Ride.create!(name: "Coaster", thrill_rating: 5, open: false, amusement_park_id: park.id)
        RideMechanic.create!(ride: ride1, mechanic: mechanic)
        RideMechanic.create!(ride: ride2, mechanic: mechanic)

        visit "/mechanics/#{mechanic.id}"

        expect(page).to have_content(mechanic.name)
        expect(page).to have_content(mechanic.years_experience)

        within("#rides") do
          expect(page).to have_content(ride1.name)
          expect(page).to have_content(ride2.name)
        end
      end
    end
  end
end