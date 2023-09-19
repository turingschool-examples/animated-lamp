require "rails_helper"

RSpec.describe AmusementPark, type: :model do
  describe "relationships" do
    it { should have_many(:rides) }
  end

  describe '#unique_mechanics' do
      it 'returns a unique list of mechanics for that amusement park' do
        meddew = AmusementPark.create!(name: "Meddew", admission_cost: 15)
        mechanic = Mechanic.create!(name: "Terry Lamb", years_experience: 6)
        mechanic_2 = Mechanic.create!(name: "Lerry Tamb", years_experience: 1)
        el_diablo = meddew.rides.create!(name: "El Diablo", thrill_rating: 8, open: true, mechanics: [mechanic, mechanic_2])
        danger = meddew.rides.create!(name: "Danger", thrill_rating: 10, open: false, mechanics: [mechanic])
        carousel = meddew.rides.create!(name: "Carousel", thrill_rating: 2, open: true, mechanics: [mechanic_2])

        expect(meddew.unique_mechanics).to eq([mechanic, mechanic_2])
      end
    end
end