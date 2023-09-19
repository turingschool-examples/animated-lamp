require "rails_helper"

RSpec.describe "mechanics show page" do
  it "shows an approve button for " do
    park_1 = AmusementPark.create!(name: "Six Flags", admission_cost: 75) 
    mechanic_1 = Mechanic.create!(name: "Charles", years_experience: 2)
    ride_1 = Ride.create!(name: "The Spinner", thrill_rating: 2, open: false, amusement_park: park_1) 
    ride_2 = Ride.create!(name: "The Drop", thrill_rating: 5, open: false, amusement_park: park_1) 
    ride_3 = Ride.create!(name: "The Charge", thrill_rating: 18, open: false, amusement_park: park_1) 
    ride_mechanic_1 = RideMechanic.create!(ride: ride_1, mechanic: mechanic_1)
    ride_mechanic_2 = RideMechanic.create!(ride: ride_2, mechanic: mechanic_1)
    ride_mechanic_3 = RideMechanic.create!(ride: ride_3, mechanic: mechanic_1)

    visit "/mechanics/#{mechanic_1.id}"

      expect(page).to have_content(mechanic_1.name)
      expect(page).to have_content("Years of Experience: #{mechanic_1.years_experience}")
      expect(page).to have_content("Current rides they are working on:")
      expect(page).to have_content(ride_1.name)
      expect(page).to have_content(ride_2.name)
      expect(page).to have_content(ride_3.name)
  end

  it "shows a form to add a ride to mechanics workload" do
    park_1 = AmusementPark.create!(name: "Six Flags", admission_cost: 75) 
    mechanic_1 = Mechanic.create!(name: "Charles", years_experience: 2)
    ride_1 = Ride.create!(name: "The Spinner", thrill_rating: 2, open: false, amusement_park: park_1) 
    ride_2 = Ride.create!(name: "The Drop", thrill_rating: 5, open: false, amusement_park: park_1) 
    ride_3 = Ride.create!(name: "The Charge", thrill_rating: 18, open: false, amusement_park: park_1) 
    ride_4 = Ride.create!(name: "The Charger", thrill_rating: 18, open: false, amusement_park: park_1) 
    ride_mechanic_1 = RideMechanic.create!(ride: ride_1, mechanic: mechanic_1)
    ride_mechanic_2 = RideMechanic.create!(ride: ride_2, mechanic: mechanic_1)
    ride_mechanic_3 = RideMechanic.create!(ride: ride_3, mechanic: mechanic_1)

    visit "/mechanics/#{mechanic_1.id}"
    expect(page).to have_content(ride_1.name)
    expect(page).to have_content(ride_2.name)
    expect(page).to have_content(ride_3.name)
    expect(page).not_to have_content(ride_4.name)
    within(".add_ride") do
      expect(page).to have_content("Add a ride to workload")
      fill_in "new_ride_id", with: "#{ride_4.id}"
      click_button "Save"
      expect(page).to have_current_path("/mechanics/#{mechanic_1.id}")
    end
    expect(page).to have_content(ride_1.name)
    expect(page).to have_content(ride_2.name)
    expect(page).to have_content(ride_3.name)
    expect(page).to have_content(ride_4.name)
  end
end
