require 'rails_helper'

RSpec.describe "When I visit the Amusement Park Show Page" do 
  before(:each) do 
    @ap_1 = AmusementPark.create!(name: "Six Flags", admission_cost: 75 )
    @ap_2 = AmusementPark.create!(name: "Elitches", admission_cost: 49 )
    
    @mechanic_1 = Mechanic.create!(name: "Kara Smith", years_experience: 11)
    @mechanic_2 = Mechanic.create!(name: "Sara Campbell", years_experience: 4)
    @mechanic_3 = Mechanic.create!(name: "Patty Applebee", years_experience: 15)
    @mechanic_4 = Mechanic.create!(name: "Scooter Tran", years_experience: 15)

    @ride_1 = @ap_1.rides.create!(name: "The Hurler", thrill_rating: 7, open: false)
    @ride_2 = @ap_1.rides.create!(name: "Tea Cups", thrill_rating: 2, open: true)

    @ride_3 = @ap_2.rides.create!(name: "Tower of Terror", thrill_rating: 10, open: true)
    @ride_4 = @ap_2.rides.create!(name: "Ferris Wheel", thrill_rating: 1, open: true)

    RideMechanic.create!(ride_id: @ride_1.id, mechanic_id: @mechanic_1.id)
    RideMechanic.create!(ride_id: @ride_1.id, mechanic_id: @mechanic_2.id)

    RideMechanic.create!(ride_id: @ride_2.id, mechanic_id: @mechanic_2.id)
    RideMechanic.create!(ride_id: @ride_2.id, mechanic_id: @mechanic_3.id)

    RideMechanic.create!(ride_id: @ride_3.id, mechanic_id: @mechanic_3.id)
    RideMechanic.create!(ride_id: @ride_3.id, mechanic_id: @mechanic_4.id)

    RideMechanic.create!(ride_id: @ride_4.id, mechanic_id: @mechanic_4.id)
    RideMechanic.create!(ride_id: @ride_4.id, mechanic_id: @mechanic_1.id)
    
  end

  scenario "I see the name and price of admissions for that amusement park" do
    visit "/amusement_parks/#{@ap_1.id}"

    within "#ap_details" do 
      expect(page).to have_content("Park Name: Six Flags")
      expect(page).to have_content("Cost of Admission: $75")
    end

  end

  scenario "I see the names of all mechanics that are working on the park's rides, this list is unique (no duplicates)" do 
    visit "/amusement_parks/#{@ap_1.id}"

    within "#active_mechanics" do 
      expect(page).to have_content("Park Mechanics: ")
      expect(page).to have_content("Kara Smith")
      expect(page).to have_content("Sara Campbell")
      expect(page).to have_content("Patty Applebee")
    end
  end
end