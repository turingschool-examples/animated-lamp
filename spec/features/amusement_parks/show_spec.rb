require 'rails_helper'

RSpec.describe "Amusement Park Show Page", type: :feature do
  before(:each) do
    @six_flags = AmusementPark.create!(name: "Six Flags", admission_cost: 75)
    @joe = Mechanic.create!(name: "Joe", years_experience: 10)
    @bob = Mechanic.create!(name: "Bob", years_experience: 2)
    @twirlygig = @six_flags.rides.create!(name: "twirlygig", thrill_rating: 4, open: false)
    @mind_eraser = @six_flags.rides.create!(name: "Mind Eraser", thrill_rating: 10, open: false)
    RideMechanic.create!(ride_id: @twirlygig.id, mechanic_id: @joe.id)
    RideMechanic.create!(ride_id: @mind_eraser.id, mechanic_id: @joe.id)
    RideMechanic.create!(ride_id: @mind_eraser.id, mechanic_id: @bob.id)
  end
  describe "As a visitor" do
    describe "When I visit /amusement_parks/:id" do
      it "I see the name and price of admissions for that amusement park" do

        visit "/amusement_parks/#{@six_flags.id}"

        expect(page).to have_content(@six_flags.name)
        expect(page).to have_content(@six_flags.admission_cost)
      end

      it "and I see the names of all mechanics workin on that parks rides" do

        visit "/amusement_parks/#{@six_flags.id}"

        expect(page).to have_content(@joe.name)
      end

      it "and I see that the list of mechanics is unique" do

        visit "/amusement_parks/#{@six_flags.id}"

        expect(page).to have_content(@joe.name, count: 1)
        expect(page).to have_content(@bob.name, count: 1)
      end

      it "I see a list of all the parks rides" do

        visit "/amusement_parks/#{@six_flags.id}"

        expect(page).to have_content(@twirlygig.name)
        expect(page).to have_content(@mind_eraser.name)

        expect(page).to have_content("AVG Mechanic Experience: #{@joe.years_experience}")
        expect(page).to have_content("AVG Mechanic Experience: 6")
      end

      it "I see the list of park rides is ordered by the average experience of mechanics on the ride" do

      end
    end
  end
end