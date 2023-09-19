require 'rails_helper'

RSpec.describe "Mechanic Show Page", type: :feature do
  before(:each) do
    @six_flags = AmusementPark.create!(name: "Six Flags", admission_cost: 75)
    @joe = Mechanic.create!(name: "Joe", years_experience: 10)
    @twirlygig = @six_flags.rides.create!(name: "twirlygig", thrill_rating: 4, open: false)
    @mind_eraser = @six_flags.rides.create!(name: "Mind Eraser", thrill_rating: 10, open: false)
    RideMechanic.create!(ride_id: @twirlygig.id, mechanic_id: @joe.id)
  end
  describe "As a visitor" do
    describe "When I visit /mechanics/:id" do
      it "I see their name, years of experienc, and the names of all
      the rides they are working on." do
        
        visit "/mechanics/#{@joe.id}"

        expect(page).to have_content(@joe.name)
        expect(page).to have_content(@joe.years_experience)
        expect(page).to have_content(@twirlygig.name)

      end

      # it "I see a from to add a ride to the mechanics work load, when I
      # fill it in with an existing ride ID and click submit I'm taken back to
      # the mechanics show page and see the name of the newly added ride" do

      #   visit "/mechanics/#@joe.id}"

      #   fill_in "Add Ride", with(mind_eraser.id)
      # end
    end
  end
end