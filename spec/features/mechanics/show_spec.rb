require "rails_helper"

RSpec.describe "Mechanic Show Page", type: :feature do
  before :each do
    @amusement_park_1 = AmusementPark.create!(name: "Six Flags", admission_cost: 75)
    @ride_1 = @amusement_park_1.rides.create!(name: "The Hurler", thrill_rating: 7, open: false)
    @ride_2 = @amusement_park_1.rides.create!(name: "Nightrider", thrill_rating: 8, open: false)
    @ride_3 = @amusement_park_1.rides.create!(name: "Dragon", thrill_rating: 8, open: true)

    @mechanic_1 = Mechanic.create!(name: "Kara Smith", years_experience: 11)
    @mechanic_2 = Mechanic.create!(name: "Tom Segura", years_experience: 4)

    @mechanic_1_ride_1 = @ride_1.mechanic_rides.create!(mechanic: @mechanic_1, ride: @ride_1)
    @mechanic_2_ride_1 = @ride_1.mechanic_rides.create!(mechanic: @mechanic_2, ride: @ride_1)
    @mechanic_1_ride_2 = @ride_2.mechanic_rides.create!(mechanic: @mechanic_1, ride: @ride_2)
  end

  # User Story 1
  it "displays the mechanic attributes and all the rides they're working on" do
    visit "/mechanics/#{@mechanic_1.id}"

    within "#mechanic_info" do
      expect(page).to have_content("Name: #{@mechanic_1.name}")
      expect(page).to have_content("Years of Experience: #{@mechanic_1.years_experience}")
      expect(page).to have_content(@ride_1.name)
      expect(page).to have_content(@ride_2.name)
    end
  end
end