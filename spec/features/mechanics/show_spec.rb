require "rails_helper"

RSpec.describe "mechanics #show" do
  before(:each) do
    @theme_park = AmusementPark.create!(name: "Itchy and Scratchy Land", admission_cost: 12)

    @ride_1 = @theme_park.rides.create!(name: "Puke Monster", thrill_rating: 3, open: false)
    @ride_2 = @theme_park.rides.create!(name: "Carousel", thrill_rating: 9, open: false)
    @ride_3 = @theme_park.rides.create!(name: "The Nauseator", thrill_rating: 6, open: false)


    @mechanic_1 = Mechanic.create!(name: "MC Ride", years_experience: 3)
    @mechanic_2 = Mechanic.create!(name: "Scruffy", years_experience: 4)
    @mechanic_3 = Mechanic.create!(name: "Fonzie", years_experience: 5)
    @mechanic_4 = Mechanic.create!(name: "Rosie", years_experience: 6)

    @workorder_1 = MechanicRide.create!(mechanic: @mechanic_1, ride: @ride_1)
    @workorder_2 = MechanicRide.create!(mechanic: @mechanic_1, ride: @ride_2)
    @workorder_3 = MechanicRide.create!(mechanic: @mechanic_3, ride: @ride_3)
    @workorder_4 = MechanicRide.create!(mechanic: @mechanic_4, ride: @ride_3) 

  end


  # User Story 1
  # As a user,
  # When I visit a mechanic show page
  # I see their name, years of experience, and the names of all rides they are working on.
  describe "mechanic #show" do
    it "when I visit a mechanic show page I see their name and years of experience" do
      visit "/mechanics/#{@mechanic_1.id}"

      expect(page).to have_content(@mechanic_1.name)
      expect(page).to have_content(@mechanic_1.years_experience)
    end

    it "and the names of all the rides they are working on." do
      visit "/mechanics/#{@mechanic_1.id}"

      expect(page).to have_content(@ride_1.name)
      expect(page).to have_content(@ride_2.name)
    end
  end
  # Story 2 - Add a Ride to a Mechanic

  # As a user,
  # When I go to a mechanic's show page
  # I see a form to add a ride to their workload
  # When I fill in that field with an id of an existing ride and click Submit
  # I’m taken back to that mechanic's show page
  # And I see the name of that newly added ride on this mechanic's show page.
  



end