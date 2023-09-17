require "rails_helper"

RSpec.describe "Mechanic Show Page", type: :feature do
  describe "as a user" do
    describe "when I visit a mechanic show page" do
      it "I see their name, years of experience, and the names of all rides they are working on" do
        amusement_park = AmusementPark.create!(
          name: "Fun World",
          admission_cost: 75
        )
        
        ride_1 = amusement_park.rides.create!(
          name: "Twisty Turny",
          thrill_rating: 8,
          open: true
        )

        ride_2 = amusement_park.rides.create!(
          name: "Slowy Slide",
          thrill_rating: 3,
          open: true
        )

        mechanic = Mechanic.create!(
          name: "Frank Fixes",
          years_experience: 12
        )

        RideMechanic.create!(mechanic: mechanic, ride: ride_1)
        RideMechanic.create!(mechanic: mechanic, ride: ride_2)

        visit mechanic_path(mechanic.id)

        expect(page).to have_content("#{mechanic.name}")
        expect(page).to have_content("Years of Experience: #{mechanic.years_experience}")
        expect(page).to have_content("Rides:")

        within("#rides") do
          expect(page).to have_content("#{ride_1.name}")
          expect(page).to have_content("#{ride_2.name}")
        end
      end

      describe "I see a form to add a ride to their workload" do
        describe "When I fill in that field with an id of an existing ride and click submit" do
          it "I'm taken back to that mechanic's show page and I see the name of that newly added ride on this mechanic's show page" do
            amusement_park = AmusementPark.create!(
              name: "Fun World",
              admission_cost: 75
            )
            
            ride_1 = amusement_park.rides.create!(
              name: "Twisty Turny",
              thrill_rating: 8,
              open: true
            )
    
            ride_2 = amusement_park.rides.create!(
              name: "Slowy Slide",
              thrill_rating: 3,
              open: true
            )

            ride_3 = amusement_park.rides.create!(
              name: "Funny Fun Time",
              thrill_rating: 5,
              open: true
            )
    
            mechanic = Mechanic.create!(
              name: "Frank Fixes",
              years_experience: 12
            )
    
            RideMechanic.create!(mechanic: mechanic, ride: ride_1)
            RideMechanic.create!(mechanic: mechanic, ride: ride_2)

            visit mechanic_path(mechanic.id)

            within("#rides") do
              expect(page).to have_content("#{ride_1.name}")
              expect(page).to have_content("#{ride_2.name}")
            end

            expect(page).to have_content("Add a ride to workload:")
            expect(page).to have_field "Ride Id:"

            fill_in "Ride Id:", with: "#{ride_3.id}"
            click_button "Submit"

            expect(current_path).to eq(mechanic_path(mechanic.id))

            within("#rides") do
              expect(page).to have_content("#{ride_2.name}")
            end
          end
        end
      end
    end
  end
end