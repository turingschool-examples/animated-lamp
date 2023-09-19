require "rails_helper"
include ActionView::Helpers::NumberHelper

RSpec.describe "mechanics show page" do
  before :each do
    @park_1 = AmusementPark.create!(name: "Diznee", admission_cost: 150) 
    @mechanic_1 = Mechanic.create!(name: "Fred Flintstone", years_experience: 5)
    @mechanic_2 = Mechanic.create!(name: "Sarah Silverwrench", years_experience: 7)
    @mechanic_3 = Mechanic.create!(name: "Fran Fixit", years_experience: 2)
    @mechanic_4 = Mechanic.create!(name: "Bob Bumble", years_experience: 1)
    @ride_1 = Ride.create!(name: 'The Hurler', thrill_rating: 7, open: true, amusement_park: @park_1) 
    @ride_2 = Ride.create!(name: 'The Scrambler', thrill_rating: 4, open: true, amusement_park: @park_1) 
    @ride_3 = Ride.create!(name: 'Ferris Wheel', thrill_rating: 7, open: false, amusement_park: @park_1) 
    @ride_mechanic_1 = RideMechanic.create!(ride: @ride_1, mechanic: @mechanic_1)
    @ride_mechanic_2 = RideMechanic.create!(ride: @ride_2, mechanic: @mechanic_2)
    @ride_mechanic_3 = RideMechanic.create!(ride: @ride_3, mechanic: @mechanic_1)
    @ride_mechanic_4 = RideMechanic.create!(ride: @ride_3, mechanic: @mechanic_2)
    @ride_mechanic_5 = RideMechanic.create!(ride: @ride_3, mechanic: @mechanic_3)

  end

#   ----------   Story 3 - Amusement Park Show page
# When I visit an amusement park’s show page,
# Then I see the name and price of admissions for that amusement park
# And I see the names of all mechanics that are working on that park's rides,
# And I see that the list of mechanics is unique
  describe "When I visit an amusement park’s show page" do
    it "shows the name & price of the park" do
      visit "/amusement_parks/#{@park_1.id}"

      expect(page).to have_content(@park_1.name)
      expect(page).to have_content("Admission Price: #{number_to_currency(@park_1.admission_cost)}")
    end

    it "shows the unique names of all mechanics that are working on that park's rides" do
      visit "/amusement_parks/#{@park_1.id}"

      expect(page).to have_content("Mechanic Roster:")
      expect(page).to have_content(@mechanic_1.name)
      expect(page).to have_content(@mechanic_2.name)
      expect(page).to have_content(@mechanic_3.name)
      expect(page).to_not have_content(@mechanic_4.name)
    end
  end
end