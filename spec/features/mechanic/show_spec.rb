require 'rails_helper'

RSpec.describe "Mechanic Show Page", type: :feature do
  describe "As a visitor" do
    describe "When I visit /mechanics/:id" do
      it "I see their name, years of experienc, and the names of all
      the rides they are working on." do
        six_flags = AmusementPark.create!(name: "Six Flags", admission_cost: 75)
        joe = Mechanic.create!(name: "Joe", years_experience: 10)
        twirlygig = six_flags.rides.create!(name: "twirlygig", thrill_rating: 4, open: false)
        RideMechanic.create!(ride_id: twirlygig.id, mechanic_id: joe.id)
        
        visit "/mechanics/#{joe.id}"

        expect(page).to have_content(joe.name)
        expect(page).to have_content(joe.years_experience)
        expect(page).to have_content(twirlygig.name)

      end
    end
  end
end