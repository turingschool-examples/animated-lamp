require 'rails_helper'

RSpec.describe 'AmusmentPark Show Page', type: :feature do

    before(:each) do
        
        @six_flags = AmusementPark.create!(name: 'Six Flags', admission_cost: 75)
        @universal = AmusementPark.create!(name: 'Universal Studios', admission_cost: 80)
        
        @mechanic = Mechanic.create!(name: 'Kara Smith', years_experience: 11)

        @hurler = @six_flags.rides.create!(name: 'The Hurler', thrill_rating: 7, open: true)
        @scrambler = @six_flags.rides.create!(name: 'The Scrambler', thrill_rating: 4, open: true)
        @ferris = @six_flags.rides.create!(name: 'Ferris Wheel', thrill_rating: 7, open: false)
        
        @jaws = @universal.rides.create!(name: 'Jaws', thrill_rating: 5, open: true)
        
        @mechanic.rides << @hurler
        @mechanic.rides << @scrambler
    end

    it "Should show the name of the amusment park" do
        visit "/amusementpark/#{@six_flags.id}"

        expect(page).to have_content(@six_flags.name)
        expect(page).to have_content(@six_flags.admission_cost)
        expect(page).to have_content(@mechanic.name, count: 1)

    end
end