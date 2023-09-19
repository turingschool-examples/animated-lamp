require "rails_helper"

RSpec.describe "Amusement Park Show Page", type: :feature do
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

      visit "/amusement_parks/#{@six_flags.id}"
    end

    describe "When I visit an Amusement Park show page" do
      it "Displays the name and price of admissions for that amusement park" do
        expect(page).to have_content(@six_flags.name)
        expect(page).to have_content(@six_flags.admission_cost)
      end

      it "Displays the names of all mechanics that are working on that park's rides," do
        expect(page).to have_content(@alex.name)
      end
    end
  end
end
