require "rails_helper"

RSpec.describe "the amusement park show page" do
  it "shows the mechanics name and info" do
    mechanic_1 = Mechanic.create!(name: "Bob Johnson", years_experience:12)
    mechanic_2 = Mechanic.create!(name: "Bart Deadlift", years_experience:3)
    mechanic_3 = Mechanic.create!(name: "Max Power", years_experience:2)
    amusement_park = AmusementPark.create!(name:"Six Flags", admission_cost:50)
    ride_1 = amusement_park.rides.create!(name:"Punisher", thrill_rating:5, open:true)
    ride_2 = amusement_park.rides.create!(name:"Hulk", thrill_rating:3, open:true)
    MechanicRide.create!(mechanic_id:mechanic_1.id, ride_id:ride_1.id)
    MechanicRide.create!(mechanic_id:mechanic_2.id, ride_id:ride_2.id)
    MechanicRide.create!(mechanic_id:mechanic_1.id, ride_id:ride_2.id)

    visit "/amusement_parks/#{amusement_park.id}"
    within "#single_amusement_park" do
      expect(page).to have_content(amusement_park.name)
      expect(page).to have_content(amusement_park.admission_cost)
      expect(page).to have_content(mechanic_1.name)
      expect(page).to have_content(mechanic_2.name)
    end
  end
end