require "rails_helper"

RSpec.describe "Mechanics Show Page", type: :feature do
  before :each do
    @sharon = Mechanic.create!(name: "Sharon", years_experience: 15)
    @maria = Mechanic.create!(name: "Maria", years_experience: 20)
    
    @elitch_gardens = AmusementPark.create!(name: "Elitch Gardens", admission_cost: 65)
    
    @twister = @elitch_gardens.rides.create!(name: "Twister", thrill_rating: 6, open: true)
    @carousel = @elitch_gardens.rides.create!(name: "Carousel", thrill_rating: 2, open: true)
    @dragon_force = @elitch_gardens.rides.create!(name: "Dragon Force", thrill_rating: 10, open: true)

    MechanicRide.create!(mechanic: @sharon, ride: @twister)
    MechanicRide.create!(mechanic: @sharon, ride: @carousel)
    MechanicRide.create!(mechanic: @maria, ride: @twister)
    MechanicRide.create!(mechanic: @maria, ride: @carousel)
  end

  describe "As a user" do
    describe "When I visit a mechanic show page" do
      it "displays their name, years of experience, and the names of all rides they are working on" do
        visit "/mechanics/#{@sharon.id}"

        expect(page).to have_content(@sharon.name)
        expect(page).to have_content("Years of experience: #{@sharon.years_experience}")
        expect(page).to have_content("Rides #{@sharon.name} is working on:")
        expect(page).to have_content(@sharon.rides.first.name)
        expect(page).to have_content(@sharon.rides.last.name)
      end

      it "displays a form to add a ride to their workload" do
        visit "/mechanics/#{@sharon.id}"

        expect(page).to have_content("Add a ride to #{@sharon.name}'s workload:")
        expect(page).to have_content("Ride id:")
        expect(page).to have_button("Submit")
      end

      describe "When I fill in that field with an id of an existing ride and click 'Submit'" do
        it "takes me back to that mechanics show page and I see the name of that newly added ride on this mechanics show page" do
          visit "/mechanics/#{@sharon.id}"

          expect(page).to_not have_content(@dragon_force.name)

          fill_in :ride_id, with: @dragon_force.id

          click_on "Submit"

          expect(current_path).to eq("/mechanics/#{@sharon.id}")

          expect(page).to have_content(@dragon_force.name)
        end
      end
    end
  end
end