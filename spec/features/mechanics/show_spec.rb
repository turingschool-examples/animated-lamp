require "rails_helper"

RSpec.describe "mechanic show page" do
  describe "when I visit a mechanic show page" do
    it "then I see their name, years of experience, and the names of all rides they are working on." do
      amusement_park1 = create(:amusement_park)
      
      mechanic1 = create(:mechanic)
      mechanic2 = create(:mechanic)
      mechanic3 = create(:mechanic)
      mechanic4 = create(:mechanic)

      ride1 = create(:ride)
      ride2 = create(:ride)

      RideMechanic.create!(ride_id: ride1.id, mechanic_id: mechanic2.id)
      RideMechanic.create!(ride_id: ride2.id, mechanic_id: mechanic4.id)

      visit mechanic_path(mechanic2)

      within("#mechanic-show-#{mechanic2.id}") do
        expect(page).to have_content(mechanic2.years_experience)
        expect(page).to have_content(ride1.name)
      end

      visit mechanic_path(mechanic4)

      within("#mechanic-show-#{mechanic4.id}") do
        expect(page).to have_content(mechanic4.name)
        expect(page).to have_content(mechanic4.years_experience)
        expect(page).to have_content(ride2.name)
        save_and_open_page
      end
    end
  end
end