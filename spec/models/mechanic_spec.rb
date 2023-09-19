require 'rails_helper'

RSpec.describe Mechanic, type: :model do
  describe "relationships" do
    it { should have_many :rides }
  end

  describe "#add_ride" do
    it "can add an item to a mechanic" do
      meddew = AmusementPark.create!(name: "Meddew", admission_cost: 15)
      mechanic = Mechanic.create!(name: "Terry Lamb", years_experience: 6)
      el_diablo = meddew.rides.create!(name: "El Diablo", thrill_rating: 8, open: true, mechanics: [mechanic])
      danger = meddew.rides.create!(name: "Danger", thrill_rating: 10, open: false, mechanics: [mechanic])
      carousel = meddew.rides.create!(name: "Carousel", thrill_rating: 2, open: true, mechanics: [])

      mechanic.add_ride(carousel.id)
      expect(mechanic.rides).to eq([el_diablo, danger, carousel])
    end
  end
end
