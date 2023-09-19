require 'rails_helper'

RSpec.describe "Mechanics Show", type: :feature do
  before(:each) do
    @mechanic = Mechanic.create(name: "Kara Smith", years_experience: 11)
    @amusement_park = AmusementPark.create(name: 'Six Flags', admission_cost: 75)
    @ride = @amusement_park.rides.create(name: "The Hurler", thrill_rating: 7, open: false)
    @ride2 = @amusement_park.rides.create(name: "Swift", thrill_rating: 10, open: true)
    MechanicRide.create(ride_id: @ride.id, mechanic_id: @mechanic.id)
  end

  it "I see their name, years of experience, and the names of all rides they are working on." do 
    visit "/mechanics/#{@mechanic.id}"

    expect(page).to have_content("#{@mechanic.name}")
    expect(page).to have_content("#{@mechanic.years_experience}")
    expect(page).to have_content(@ride.name)
  end

  it "I see a form to add a ride to their workload" do 
    visit "/mechanics/#{@mechanic.id}"

    expect(page).to have_content("Add Ride")
    expect(page).to have_field("Ride Id")
  end

  it "When I fill in that field with an id of an existing ride and submit, redirected to show page with newly added ride" do 
    visit "/mechanics/#{@mechanic.id}"

    fill_in "Ride Id", with: "#{@ride2.id}"
    click_button("Add Ride")

    expect(page).to have_content(@ride2.name)
  end
end