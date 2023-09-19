require "rails_helper"

RSpec.describe "Mechanic show page" do 
  describe "as a visitor to /mechanics/:id" do 
    before :each do 
      @joel = Mechanic.create!(name: "Joel Taylor", years_experience: 1)

      @hw = AmusementPark.create!(name: "Holiday World", admission_cost: 5)

      @raven = Ride.create!(name: "The Raven", thrill_rating: 4, open: true, amusement_park_id: @hw.id)
      @woody = Ride.create!(name: "The Wild Woody", thrill_rating: 2, open: true, amusement_park_id: @hw.id)
      @wheel = Ride.create!(name: "The Wheel of Death", thrill_rating: 5, open: false, amusement_park_id: @hw.id)

      @mech = RideMechanic.create!(ride_id: @raven.id, mechanic_id: @joel.id)
    end
    
    it "shows name, years of experience, and names of rides they're working on" do 
      visit "/mechanics/#{@joel.id}"
# require 'pry'; binding.pry
      expect(page).to have_content("Merchant Show Page")
      expect(page).to have_content("Name: #{@joel.name}")
      expect(page).to have_content("Years experience: #{@joel.years_experience}")
      # expect(page).to have_content("Rides being worked on:")
      # expect(page).to have_content(@raven.name)
      # expect(page).to have_content(@woody.name)

      expect(page).to_not have_content(@wheel.name)

      # save_and_open_page
    end
  end
end