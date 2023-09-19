require "rails_helper"

RSpec.describe "Amusement Park's Show Page", type: :feature do
  before :each do
    @amusement_park_1 = AmusementPark.create!(name: "Six Flags", admission_cost: 75)
    @ride_1 = @amusement_park_1.rides.create!(name: "The Hurler", thrill_rating: 7, open: false)
    @ride_2 = @amusement_park_1.rides.create!(name: "Nightrider", thrill_rating: 8, open: false)
    @ride_3 = @amusement_park_1.rides.create!(name: "Dragon", thrill_rating: 8, open: true)
    @ride_4 = @amusement_park_1.rides.create!(name: "Thunder Speed", thrill_rating: 9, open: false)

    @mechanic_1 = Mechanic.create!(name: "Kara Smith", years_experience: 11)
    @mechanic_2 = Mechanic.create!(name: "Tom Segura", years_experience: 4)

    @mechanic_1_ride_1 = @ride_1.mechanic_rides.create!(mechanic: @mechanic_1, ride: @ride_1)
    @mechanic_2_ride_1 = @ride_1.mechanic_rides.create!(mechanic: @mechanic_2, ride: @ride_1)
    @mechanic_1_ride_2 = @ride_2.mechanic_rides.create!(mechanic: @mechanic_1, ride: @ride_2)
  end

  # User Story 3
  it "displays the name, price of admission, and the names of all unique mechanics working on that park's rides" do
    visit "/amusement_parks/#{@amusement_park_1.id}"

    within "#mechanics_working" do
      expect(page).to have_content(@mechanic_1.name)
      expect(page).to have_content(@mechanic_2.name)
    end
  end
end