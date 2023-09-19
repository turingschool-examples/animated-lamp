require 'rails_helper'

RSpec.describe "Mechanics Show", type: :feature do
  before(:each) do
    @mechanic_1 = Mechanic.create!(name: "Kiwi Mechanic", years_experience: 2)
    @mechanic_2 = Mechanic.create!(name: "Coco Mechanic", years_experience: 1)

    @park_1 = AmusementPark.create!(name: "Chicken's Park", admission_cost: 50)

    @ride_1 = Ride.create!(name: "Hiccup's Coaster", thrill_rating: 1, open: true, amusement_park_id: @park_1.id)
    @ride_2 = Ride.create!(name: "Hiccup's Teacups", thrill_rating: 10, open: false, amusement_park_id: @park_1.id)

    RideMechanic.create!(ride_id: @ride_1.id, mechanic_id: @mechanic_1.id)
  end

  describe "When I visit the mechanics show page" do
    it "I see their name, years of experience, and the names of all rides they're working on" do
      visit "/mechanics/#{@mechanic_1.id}"

      expect(page).to have_content(@mechanic_1.name)
      expect(page).to have_content(@mechanic_1.years_experience)
      within("#mechanic-rides") do
        expect(page).to have_content(@ride_1.name)
      end

      expect(page).to_not have_content(@mechanic_2.name)
      expect(page).to_not have_content(@ride_2.name)
    end

    it "I see a form to add a ride to their workload" do
      visit "/mechanics/#{@mechanic_1.id}"

      within("#ride-form") do
        expect(page).to have_field("ride_id")
        expect(page).to have_button("Add Ride")
      end
    end

    it "when I fill in the ride form with an ID, the corresponding ride is added to their workload and the page displays the newly added ride" do
      visit "/mechanics/#{@mechanic_1.id}"

      expect(page).to_not have_content(@ride_2.name)

      within("#ride-form") do
        fill_in("ride_id", with: @ride_2.id)
        click_button("Add Ride")
      end

      expect(page).to have_current_path("/mechanics/#{@mechanic_1.id}")

      within("#mechanic-rides") do
        expect(page).to have_content(@ride_1.name)
        expect(page).to have_content(@ride_2.name)
      end
    end

    it "when the form is filled with an invalid ride ID, a flash error is shown" do
      visit "/mechanics/#{@mechanic_1.id}"
      
      within("#ride-form") do
        fill_in("ride_id", with: "a")
        click_button("Add Ride")
      end

      expect(page).to have_current_path("/mechanics/#{@mechanic_1.id}")
      expect(page).to have_content("Could not add the ride specified.")
    end
  end
end