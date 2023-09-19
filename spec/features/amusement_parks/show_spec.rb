require 'rails_helper'

RSpec.describe "Amusement Park Show", type: :feature do
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
  end
end