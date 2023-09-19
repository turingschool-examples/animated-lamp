require "rails_helper"

RSpec.describe "Amusement Park Show Page", type: :feature do
  describe "as a visitor" do
    describe "when I visit an amusement park's show page" do
      it "I see the name and price of admissions for that amusement park, I see the names of all mechanics that are working on that park's rides, and I see that the list of mechanics is unique" do
        amusement_park_1 = AmusementPark.create!(
          name: "Fun World",
          admission_cost: 75
        )

        amusement_park_2 = AmusementPark.create!(
          name: "Even More Fun World",
          admission_cost: 100
        )
        
        ride_1 = amusement_park_1.rides.create!(
          name: "Twisty Turny",
          thrill_rating: 8,
          open: true
        )

        ride_2 = amusement_park_1.rides.create!(
          name: "Slowy Slide",
          thrill_rating: 3,
          open: true
        )

        ride_3 = amusement_park_1.rides.create!(
          name: "Funny Fun Time",
          thrill_rating: 5,
          open: true
        )

        ride_4 = amusement_park_2.rides.create!(
          name: "WEeEEEe",
          thrill_rating: 8,
          open: true
        )

        mechanic_1 = Mechanic.create!(
          name: "Frank Fixes",
          years_experience: 12
        )

        mechanic_2 = Mechanic.create!(
          name: "Abby Awesome",
          years_experience: 2
        )

        RideMechanic.create!(mechanic: mechanic_1, ride: ride_1)
        RideMechanic.create!(mechanic: mechanic_1, ride: ride_2)
        RideMechanic.create!(mechanic: mechanic_2, ride: ride_2)
        RideMechanic.create!(mechanic: mechanic_2, ride: ride_3)

        visit amusement_park_path(amusement_park_1.id)

        expect(page).to have_content("#{amusement_park_1.name}")
        expect(page).to have_content("Price: #{amusement_park_1.admission_cost}")

        expect(page).to have_content("Mechanics working on rides:")
        within("#mechanics") do
          expect(page).to have_content("#{mechanic_1.name}")
          expect(page).to have_content("#{mechanic_2.name}")
        end
      end

      it "I see a list of all of the park's rides, next to the ride name I see the average experience of the mechanics working on the ride, and I see the list f rides is ordered by teha verage experience of mechanics working on the ride" do
        amusement_park_1 = AmusementPark.create!(
          name: "Fun World",
          admission_cost: 75
        )
        
        ride_1 = amusement_park_1.rides.create!(
          name: "Twisty Turny",
          thrill_rating: 8,
          open: true
        )

        ride_2 = amusement_park_1.rides.create!(
          name: "Slowy Slide",
          thrill_rating: 3,
          open: true
        )

        mechanic_1 = Mechanic.create!(
          name: "Frank Fixes",
          years_experience: 12
        )

        mechanic_2 = Mechanic.create!(
          name: "Abby Awesome",
          years_experience: 2
        )

        mechanic_3 = Mechanic.create!(
          name: "Eliza Engineer",
          years_experience: 25
        )

        mechanic_4 = Mechanic.create!(
          name: "Bob Builder",
          years_experience: 40
        )

        RideMechanic.create!(ride: ride_1, mechanic: mechanic_1)
        RideMechanic.create!(ride: ride_1, mechanic: mechanic_2)
        RideMechanic.create!(ride: ride_2, mechanic: mechanic_3)
        RideMechanic.create!(ride: ride_2, mechanic: mechanic_4)

        visit amusement_park_path(amusement_park_1.id)

        expect(page).to have_content("Rides:")
        within("#rides") do
          expect(page).to have_content("#{ride_1.name}, Average experience of mechanics: 7.0 years")
          expect(page).to have_content("#{ride_2.name}, Average experience of mechanics: 32.5 years")

          expect("#{ride_1.name}, Average experience of mechanics: 7.0 years").to appear_before("#{ride_2.name}, Average experience of mechanics: 32.5 years")
        end
      end
    end
  end
end