require "rails_helper"

RSpec.describe "amusement park #show" do
  before(:each) do
    @theme_park = AmusementPark.create!(name: "Itchy and Scratchy Land", admission_cost: 12)

    @ride_1 = @theme_park.rides.create!(name: "Puke Monster", thrill_rating: 3, open: false)
    @ride_2 = @theme_park.rides.create!(name: "Carousel", thrill_rating: 9, open: false)
    @ride_3 = @theme_park.rides.create!(name: "The Nauseator", thrill_rating: 6, open: false)
    @ride_4 = @theme_park.rides.create!(name: "Eggsplosion", thrill_rating: 25, open: false)


    @mechanic_1 = Mechanic.create!(name: "MC Ride", years_experience: 3)
    @mechanic_2 = Mechanic.create!(name: "Scruffy", years_experience: 4)
    @mechanic_3 = Mechanic.create!(name: "Fonzie", years_experience: 5)
    @mechanic_4 = Mechanic.create!(name: "Rosie", years_experience: 6)

    @workorder_1 = MechanicRide.create!(mechanic: @mechanic_1, ride: @ride_1)
    @workorder_2 = MechanicRide.create!(mechanic: @mechanic_1, ride: @ride_2)
    @workorder_3 = MechanicRide.create!(mechanic: @mechanic_3, ride: @ride_3)
    @workorder_4 = MechanicRide.create!(mechanic: @mechanic_4, ride: @ride_3) 
  end

  # Story 3 - Amusement Park Show page

  # As a visitor,
  # When I visit an amusement park’s show page,
  # Then I see the name and price of admissions for that amusement park
  # And I see the names of all mechanics that are working on that park's rides,
  # And I see that the list of mechanics is unique

    describe "amusement_park #show page US3 " do
      it "see the name and price of admissions for that amusement park" do
        visit "/amusement_parks/#{@theme_park.id}"

        expect(page).to have_content(@theme_park.name)
        expect(page).to have_content(@theme_park.admission_cost)
      end

      it "see the names of all mechanics that are working on that park's rides" do
        visit "/amusement_parks/#{@theme_park.id}"

        expect(page).to match_array([@mechanic_1.name, @mechanic_2.name, @mechanic_3.name, @mechanic_4.name])
      end

    end
  end
