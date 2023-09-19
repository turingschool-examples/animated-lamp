require 'rails_helper'

RSpec.describe "Mechanics Show", type: :feature do
  before(:each) do
    @mechanic = Mechanic.create(name: "Kara Smith", years_experience: 11)
    @mechanic2 = Mechanic.create(name: "Cara Smith", years_experience: 12)
    @amusement_park = AmusementPark.create(name: 'Six Flags', admission_cost: 75)
    @ride = @amusement_park.rides.create(name: "The Hurler", thrill_rating: 7, open: false)
    @ride2 = @amusement_park.rides.create(name: "Swift", thrill_rating: 10, open: true)
    @ride3 = @amusement_park.rides.create(name: "Boom", thrill_rating: 9, open: true)
    MechanicRide.create(ride_id: @ride.id, mechanic_id: @mechanic.id)
    MechanicRide.create(ride_id: @ride3.id, mechanic_id: @mechanic2.id)
  end

  it "I see the name and price of admissions for that amusement park along with mechanics on that park" do 
    visit "/amusement_parks/#{@amusement_park.id}"

    expect(page).to have_content(@amusement_park.name)
    expect(page).to have_content(@amusement_park.admission_cost)

    expect(page).to have_content(@mechanic.name)
    expect(page).to have_content(@mechanic2.name)
  end
end