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
    end
  end
end