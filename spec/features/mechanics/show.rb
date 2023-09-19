require "rails_helper"

RSpec.feature "the mechanics show page" do
  describe 'when I visit a mechanics show page' do
    it 'US1 displays name, years of experience, and names of all rides theyre working on' do
      @six_flags = AmusementPark.create!(name: 'Six Flags', admission_cost: 75)
      @universal = AmusementPark.create!(name: 'Universal Studios', admission_cost: 80)

      @hurler = @six_flags.rides.create!(name: 'The Hurler', thrill_rating: 7, open: true)
      @scrambler = @six_flags.rides.create!(name: 'The Scrambler', thrill_rating: 4, open: true)
      @ferris = @six_flags.rides.create!(name: 'Ferris Wheel', thrill_rating: 7, open: false)

      @jaws = @universal.rides.create!(name: 'Jaws', thrill_rating: 5, open: true)

      @mechanic_1 = Mechanic.create!(name: 'Kara Smith', years_experience: 11)

      RideMechanic.create!(mechanic: @mechanic_1, ride: @hurler)
      RideMechanic.create!(mechanic: @mechanic_1, ride: @scrambler)

      visit "/mechanics/#{@mechanic_1.id}"

      expect(page).to have_content(@mechanic_1.name)
      expect(page).to have_content(@mechanic_1.years_experience)
      expect(page).to have_content(@hurler.name)
      expect(page).to have_content(@scrambler.name)
      expect(page).to_not have_content(@ferris.name)
    end
  end
end