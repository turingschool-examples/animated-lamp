require "rails_helper"

RSpec.describe "the mechanic show page" do
  it "shows the mechanics name and info" do
    mechanic = Mechanic.create!(name: "Bob", years_experience:12)
    amusement_park = AmusementPark.create!(name:"Six Flags", admission_cost:50)
    ride_1 = amusement_park.rides.create!(name:"Punisher", thrill_rating:5, open:true)
    ride_2 = amusement_park.rides.create!(name:"Hulk", thrill_rating:3, open:true)
    MechanicRide.create!(mechanic_id:mechanic.id, ride_id:ride_1.id)
    MechanicRide.create!(mechanic_id:mechanic.id, ride_id:ride_2.id)

    visit "/mechanics/#{mechanic.id}"
    within "#single_mechanic"
    expect(page).to have_content(mechanic.name)
    expect(page).to have_content(mechanic.years_experience)
    expect(page).to have_content(ride_1.name)
    expect(page).to have_content(ride_2.name)
  end
end