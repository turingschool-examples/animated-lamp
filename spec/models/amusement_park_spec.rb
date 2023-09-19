require "rails_helper"

RSpec.describe AmusementPark, type: :model do
  before :each do
    load_test_data
  end

  describe "relationships" do
    it { should have_many(:rides) }
    it { should have_many(:mechanic_rides).through(:rides) }
    it { should have_many(:mechanics).through(:mechanic_rides) }
  end

  describe "#hired_mechanics" do
    it "can return a unique array of mechanics" do
      expect(@six_flags.hired_mechanics).to match_array([@kara, @bart])
    end
  end
end