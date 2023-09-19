
require "rails_helper"

RSpec.describe "amusement park show page" do
  it "shows an approve button for " do
    park_1 = AmusementPark.create!(name: "Six Flags", admission_cost: 75) 
    mechanic_1 = Mechanic.create!(name: "Charles", years_experience: 2)
    ride_1 = Ride.create!(name: "The Spinner", thrill_rating: 2, open: false, amusement_park: park_1) 
    ride_2 = Ride.create!(name: "The Drop", thrill_rating: 5, open: false, amusement_park: park_1) 
    ride_3 = Ride.create!(name: "The Charge", thrill_rating: 18, open: false, amusement_park: park_1) 
    ride_mechanic_1 = RideMechanic.create!(ride: ride_1, mechanic: mechanic_1)
    ride_mechanic_2 = RideMechanic.create!(ride: ride_2, mechanic: mechanic_1)
    ride_mechanic_3 = RideMechanic.create!(ride: ride_3, mechanic: mechanic_1)

    mechanic_2 = Mechanic.create!(name: "Charles", years_experience: 2)
    ride_4 = Ride.create!(name: "The Charger", thrill_rating: 18, open: false, amusement_park: park_1) 
    ride_mechanic_4 = RideMechanic.create!(ride: ride_4, mechanic: mechanic_2)



    visit "/amusement_parks/#{park_1.id}"

      expect(page).to have_content(park_1.name)
      expect(page).to have_content("Price of Admission: #{park_1.admission_cost}")
      expect(page).to have_content("Mechanics:")
      expect(page).to have_content(mechanic_1.name)
      expect(page).to have_content(mechanic_2.name)
  end
end