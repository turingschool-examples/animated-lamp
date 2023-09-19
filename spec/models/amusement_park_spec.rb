require "rails_helper"

RSpec.describe AmusementPark, type: :model do
  describe "relationships" do
    it { should have_many(:rides) }
    it { should have_many(:mechanics).through(:rides) }  
  end

  describe 'instance methods' do
    describe '#unique_mechanics' do
      it 'returns a list of unique mechanics' do
        @six_flags = AmusementPark.create!(name: 'Six Flags', admission_cost: 75)

        @hurler = @six_flags.rides.create!(name: 'The Hurler', thrill_rating: 7, open: true)
        @scrambler = @six_flags.rides.create!(name: 'The Scrambler', thrill_rating: 4, open: true)
        @ferris = @six_flags.rides.create!(name: 'Ferris Wheel', thrill_rating: 7, open: false)

        @mechanic_1 = Mechanic.create!(name: 'Kara Smith', years_experience: 11)
        @mechanic_2 = Mechanic.create!(name: 'John Doe', years_experience: 5)

        RideMechanic.create!(mechanic: @mechanic_1, ride: @hurler)
        RideMechanic.create!(mechanic: @mechanic_1, ride: @scrambler)

        expect(@six_flags.unique_mechanics).to eq([@mechanic_1])
      end
    end
  end
end