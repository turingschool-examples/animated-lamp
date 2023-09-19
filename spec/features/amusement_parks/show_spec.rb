require 'rails_helper'

RSpec.describe "Amusement Park Show Page" do
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
    @ride_mechanic5 = RideMechanic.create!(ride: @jaws, mechanic: @Will)
    @ride_mechanic6 = RideMechanic.create!(ride: @log_flume, mechanic: @Steve)
    @ride_mechanic7 = RideMechanic.create!(ride: @scrambler, mechanic: @Steve)
    @ride_mechanic8 = RideMechanic.create!(ride: @scrambler, mechanic: @Will)
    @ride_mechanic9 = RideMechanic.create!(ride: @jaws, mechanic: @Steve)
  end

  describe "#show" do
    it "displays amusement park name, admission cost, and list of unique mechanics" do
      visit "/amusement_parks/#{@six_flags.id}"

      expect(page).to have_content(@six_flags.name)
      expect(page).to have_content(@six_flags.admission_cost)
      expect(page).to have_content("Mechanics that work here:")
      within("#mechanic-#{@Steve.id}") do 
        expect(page).to have_content(@Steve.name)
      end
    end 
  end
end