# Story 1 - Mechanic Show Page

# As a user,
# When I visit a mechanic show page
# I see their name, years of experience, and the names of all rides they are working on.
require "rails_helper"

RSpec.describe "the mechanic show page" do
  describe "US1 visit a mechanic show page" do
    it "I see their name, years of experience and the names of all rides they are working on" do
      @amusement_park = AmusementPark.create!(
        name: "7 Flags",
        admission_cost: 99
      )
      @mechanic = Mechanic.create!(
        name: "Satoshi Nakamoto",
        years_experience: 15
      )
      @ride_1 = @mechanic.rides.create!(
        amusement_park: @amusement_park,
        name: "the flash",
        thrill_rating: 10,
        open: true
      )
      @ride_2 = @mechanic.rides.create!(
        amusement_park: @amusement_park,
        name: "the batman",
        thrill_rating: 5,
        open: true
      )

      visit "/mechanics/#{@mechanic.id}"

      expect(page).to have_content("Name: #{@mechanic.name}")
      expect(page).to have_content("Years of Experience: #{@mechanic.years_experience}")

      expect(page).to have_content("Current rides they are working on:")
      expect(page).to have_content("#{@ride_1.name}")
      expect(page).to have_content("#{@ride_2.name}")
    end
  end

  describe "US2 add a ride to a mechanic" do
    describe "When I go to a mechanic's show page I see a form to add a ride to their workload" do
      it "When I fill in that field with an id of an existing ride and click Submit I amm taken back to that mechanic's show page and I see the name of that newly added ride on this mechanic's show page" do
        @amusement_park = AmusementPark.create!(
          name: "7 Flags",
          admission_cost: 99
        )
        @mechanic = Mechanic.create!(
          name: "Satoshi Nakamoto",
          years_experience: 15
        )
        @ride_1 = @mechanic.rides.create!(
          amusement_park: @amusement_park,
          name: "the flash",
          thrill_rating: 10,
          open: true
        )
        @ride_2 = @mechanic.rides.create!(
          amusement_park: @amusement_park,
          name: "the batman",
          thrill_rating: 5,
          open: true
        )

        visit "/mechanics/#{@mechanic.id}"
      end
    end
  end
end
