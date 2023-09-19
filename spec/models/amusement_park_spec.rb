require "rails_helper"

RSpec.describe AmusementPark, type: :model do
  describe "relationships" do
    it { should have_many(:rides) }
    it { should have_many(:mechanics).through(:rides) }
  end

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

  describe "instance methods" do
    it "#unique_mechanics" do
      expect(@six_flags.unique_mechanics).to eq([@Steve, @Amanda, @Will])
    end

    it "#average_mechanic_experience_on_ride" do
      six_flags = AmusementPark.create!(name: 'Six Flags', admission_cost: 75)
      ride1 = six_flags.rides.create!(name: 'The Hurler', thrill_rating: 7, open: true)
      ride2 = six_flags.rides.create!(name: 'The Scrambler', thrill_rating: 4, open: true)
      ride3 = six_flags.rides.create!(name: 'Ferris Wheel', thrill_rating: 7, open: false)
      steve = Mechanic.create!(name: 'Steve', years_experience: 5)
      amanda = Mechanic.create!(name: 'Amanda', years_experience: 10)
      will = Mechanic.create!(name: 'Will', years_experience: 3)
      faith = Mechanic.create!(name: 'Faith', years_experience: 2)
      ride_mechanic1 = RideMechanic.create!(ride: ride1, mechanic: steve)
      ride_mechanic2 = RideMechanic.create!(ride: ride1, mechanic: amanda)
      ride_mechanic3 = RideMechanic.create!(ride: ride2, mechanic: will)
      ride_mechanic4 = RideMechanic.create!(ride: ride2, mechanic: steve)
      ride_mechanic5 = RideMechanic.create!(ride: ride3, mechanic: faith)
      ride_mechanic6 = RideMechanic.create!(ride: ride3, mechanic: will)
      # require 'pry';binding.pry

      expect(six_flags.average_mechanic_experience_on_ride).to eq([ride1, ride2, ride3])
    end
  end
end