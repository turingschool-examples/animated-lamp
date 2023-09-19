require "rails_helper"

RSpec.describe Mechanic, type: :model do
  before :each do
    load_test_data
  end

  describe "relationships" do
    it { should have_many(:mechanic_rides) }
    it { should have_many(:rides).through(:mechanic_rides) }
    it { should have_many(:amusement_parks).through(:rides) }
  end
end