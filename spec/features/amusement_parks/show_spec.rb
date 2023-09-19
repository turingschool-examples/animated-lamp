require 'rails_helper'

RSpec.describe "Amusement Park Show Page", type: :feature do
  before(:each) do
    @six_flags = AmusementPark.create!(name: "Six Flags", admission_cost: 75)
    @joe = Mechanic.create!(name: "Joe", years_experience: 10)
    @twirlygig = @six_flags.rides.create!(name: "twirlygig", thrill_rating: 4, open: false)
    @mind_eraser = @six_flags.rides.create!(name: "Mind Eraser", thrill_rating: 10, open: false)
    RideMechanic.create!(ride_id: @twirlygig.id, mechanic_id: @joe.id)
  end
  describe "As a visitor" do
    describe "When I visit /amusement_parks/:id" do
      it "I see the name and price of admissions for that amusement park" do

        visit "/amusement_parks/#{@six_flags.id}"

        expect(page).to have_content(@six_flags.name)
        expect(page).to have_content(@six_flags.admission_cost)
      end

      it "and I see the names of all mechanics workin on that parks rides" do

        expect(page).to have_content(@joe.name)
      end

      it "and I see that the list of mechanics is unique" do

        expect(page).to have_content(@joe.name, count: 1)
      end
    end
  end
end