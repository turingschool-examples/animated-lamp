require "rails_helper"

RSpec.describe "Mechanic Show Page", type: :feature do
  describe "As a visitor" do
    before :each do
      @six_flags = AmusementPark.create!(name: 'Six Flags', admission_cost: 75)
      @universal = AmusementPark.create!(name: 'Universal Studios', admission_cost: 80)

      @hurler = @six_flags.rides.create!(name: 'The Hurler', thrill_rating: 7, open: true)
      @scrambler = @six_flags.rides.create!(name: 'The Scrambler', thrill_rating: 4, open: true)
      @ferris = @six_flags.rides.create!(name: 'Ferris Wheel', thrill_rating: 7, open: false)

      @jaws = @universal.rides.create!(name: 'Jaws', thrill_rating: 5, open: true)

      @bob = Mechanic.create!(name: 'Bob', years_experience: 10)
      @sue = Mechanic.create!(name: 'Sue', years_experience: 15)
      @alex = Mechanic.create!(name: 'Alex', years_experience: 20)

      @ride_mechanic1 = RideMechanic.create!(mechanic_id: @alex.id, ride_id: @hurler.id)
      @ride_mechanic1 = RideMechanic.create!(mechanic_id: @alex.id, ride_id: @ferris.id)

      visit "/mechanics/#{@alex.id}"
    end

    describe "When I visit a mechanic show page" do
      it "Shows their name, experience, and rides they're currently working on" do
        expect(page).to have_content("Alex's Show Page")
        expect(page).to have_content("Name: Alex")
        expect(page).to have_content("Years of Experience: 20")
        expect(page).to have_content("Rides Currently Servicing:")
        within("div.ride-list") do
          expect(page).to have_content("Hurler")
          expect(page).to have_content("Ferris")
        end
      end

      it "Has a form to add a ride to their workload" do
        within("div.ride-list") do
          expect(page).to have_content("Hurler")
          expect(page).to have_content("Ferris")
          expect(page).to_not have_content("Scrambler")
        end
        # save_and_open_page

        expect(page).to have_content("Add a ride to workload:")
        expect(page).to have_field("Ride Id:")
        fill_in "Ride Id:", with: 2
        click_button "Submit"
        expect(current_path).to eq("/mechanics/#{@alex.id}")

        within("div.ride-list") do
          expect(page).to have_content("Scrambler")
        end
      end
    end
  end
end