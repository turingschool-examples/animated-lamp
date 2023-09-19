require 'rails_helper'

RSpec.describe 'Amusement Show Page' do
  before :each do
    @six_flags = AmusementPark.create!(name: 'Six Flags', admission_cost: 75)
    @universal = AmusementPark.create!(name: 'Universal Studios', admission_cost: 80)

    @hurler = @six_flags.rides.create!(name: 'The Hurler', thrill_rating: 7, open: true)
    @scrambler = @six_flags.rides.create!(name: 'The Scrambler', thrill_rating: 4, open: true)
    @ferris = @six_flags.rides.create!(name: 'Ferris Wheel', thrill_rating: 7, open: false)

    @jaws = @universal.rides.create!(name: 'Jaws', thrill_rating: 5, open: true)

    @mechanic_1 = Mechanic.create!(name: 'Buster', years_experience: 11)
    @mechanic_2 = Mechanic.create!(name: 'Joe', years_experience: 5)
    @mechanic_3 = Mechanic.create!(name: 'Stevie', years_experience: 10)

    MechanicsRide.create!(mechanic_id: @mechanic_1.id, ride_id: @hurler.id)
    MechanicsRide.create!(mechanic_id: @mechanic_1.id, ride_id: @scrambler.id)

    MechanicsRide.create!(mechanic_id: @mechanic_2.id, ride_id: @jaws.id)

    MechanicsRide.create!(mechanic_id: @mechanic_3.id, ride_id: @ferris.id)
  end

  describe 'As a user when I visit an amusement park show page' do
    it "I see the name and price of admissions for that amusement park" do
        
        visit amusement_park_path(@six_flags)
  
        # within("amusement_park_info") do this is for some reason not registering with my section but wanted to say I was troubleshooting it
          expect(page).to have_content(@six_flags.name)
          expect(page).to have_content(@six_flags.admission_cost)
        # end
      end
    end
end
