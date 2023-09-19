require 'rails_helper'

RSpec.describe "Amusement Park Show", type: :feature do
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
  
  describe "When I visit the amusement park show page" do
    it "I see the name and price of admission for the park" do
      visit "/amusement_parks/#{@park_1.id}"

      expect(page).to have_content("Name: #{@park_1.name}")
      expect(page).to have_content("Admission Fee: $#{@park_1.admission_cost}")
    end

    it "I see a unique list of all mechanics working at that park" do
      visit "/amusement_parks/#{@park_1.id}"

      within("#mechanics") do
        expect(page).to have_content("#{@mechanic_1.name} #{@mechanic_2.name}")
        expect(page).to_not have_content("#{@mechanic_1.name} #{@mechanic_1.name} #{@mechanic_2.name}")
      end
    end

    it "I see a list of all rides for the park with the average experience of the mechanics working on the ride" do
      visit "/amusement_parks/#{@park_1.id}"

      within("#rides") do
        expect(page).to have_content(@ride_1.name)
        expect(page).to have_content(@ride_2.name)
        expect(page).to have_content(@ride_3.name)

        within("#ride-#{@ride_1.id}") do
          expect(page).to have_content("Average mechanic experience: 1.5 years")
        end
        within("#ride-#{@ride_2.id}") do
          expect(page).to have_content("Average mechanic experience: 2.0 years")
        end
        within("#ride-#{@ride_3.id}") do
          expect(page).to have_content("Average mechanic experience: 5.0 years")
        end
      end
    end

    it "the list of all rides is ordered by the average experience of mechanics working on the ride" do
      visit "/amusement_parks/#{@park_1.id}"

      within("#rides") do
        expect(find("#ride-#{@ride_3.id}")).to appear_before(find("#ride-#{@ride_2.id}"))
        expect(find("#ride-#{@ride_2.id}")).to appear_before(find("#ride-#{@ride_1.id}"))
      end
    end
  end
end