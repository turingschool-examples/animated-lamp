require "rails_helper"

RSpec.describe "mechanics show page" do
  before :each do
    @park_1 = AmusementPark.create!(name: "Diznee", admission_cost: 150) 
    @mechanic_1 = Mechanic.create!(name: "Fred Flintstone", years_experience: 5)
    @mechanic_2 = Mechanic.create!(name: "Sarah Silverwrench", years_experience: 7)
    @ride_1 = Ride.create!(name: 'The Hurler', thrill_rating: 7, open: true, amusement_park: @park_1) 
    @ride_2 = Ride.create!(name: 'The Scrambler', thrill_rating: 4, open: true, amusement_park: @park_1) 
    @ride_3 = Ride.create!(name: 'Ferris Wheel', thrill_rating: 7, open: false, amusement_park: @park_1) 
    @ride_mechanic_1 = RideMechanic.create!(ride: @ride_1, mechanic: @mechanic_1)
    @ride_mechanic_2 = RideMechanic.create!(ride: @ride_2, mechanic: @mechanic_2)
    @ride_mechanic_3 = RideMechanic.create!(ride: @ride_3, mechanic: @mechanic_1)

  end

  # --------  Story 1 - Mechanic Show Page
  # When I visit a mechanic show page
  # I see their name, years of experience, and the names of all rides they are working on.
  describe "When I visit a mechanic show page" do
    it "shows their name, years of experience, and all rides they are working on" do
      visit "/mechanics/#{@mechanic_1.id}"
      expect(page).to have_content(@mechanic_1.name)
      expect(page).to have_content(@mechanic_1.years_experience)
      expect(page).to have_content('The Hurler')
      expect(page).to have_content('Ferris Wheel')
      
      expect(page).to_not have_content(@mechanic_2.name)
      expect(page).to_not have_content(@mechanic_2.years_experience)
      expect(page).to_not have_content('The Scrambler')
    end

  end
end