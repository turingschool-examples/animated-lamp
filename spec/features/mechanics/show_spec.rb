require 'rails_helper'

RSpec.describe "When I visit '/mechanics/:id'" do
  before :each do
    @six_flags = AmusementPark.create!(name: 'Six Flags', admission_cost: 75)
    @universal = AmusementPark.create!(name: 'Universal Studios', admission_cost: 80)

    @hurler = @six_flags.rides.create!(name: 'The Hurler', thrill_rating: 7, open: true)
    @scrambler = @six_flags.rides.create!(name: 'The Scrambler', thrill_rating: 4, open: true)
    @ferris = @six_flags.rides.create!(name: 'Ferris Wheel', thrill_rating: 7, open: false)

    @jaws = @universal.rides.create!(name: 'Jaws', thrill_rating: 5, open: true)
    @log_flume = @universal.rides.create!(name: 'Log Flume', thrill_rating: 8, open: true)
    @twister = @universal.rides.create!(name: 'Twister', thrill_rating: 9, open: false)

    @Steve = Mechanic.create!(name: 'Steve', years_experience: 5)
    @Amanda = Mechanic.create!(name: 'Amanda', years_experience: 10)
    @Will = Mechanic.create!(name: 'Will', years_experience: 3)

    @ride_mechanic1 = RideMechanic.create!(ride: @hurler, mechanic: @Steve)
    @ride_mechanic2 = RideMechanic.create!(ride: @hurler, mechanic: @Amanda)
    @ride_mechanic3 = RideMechanic.create!(ride: @scrambler, mechanic: @Amanda)
    @ride_mechanic4 = RideMechanic.create!(ride: @ferris, mechanic: @Will)
  end
  describe "#show" do
    it "I see the mechanic's name, years of experience, and names of all rides they’re working on" do
      visit "/mechanics/#{@Amanda.id}"

      expect(page).to have_content(@Amanda.name)
      expect(page).to have_content(@Amanda.years_experience)

      expect(page).to have_content("Rides on their Docket")
      expect(page).to have_content(@hurler.name)
      expect(page).to have_content(@scrambler.name)
    end
  end
end