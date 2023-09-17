require "rails_helper"

RSpec.describe Ride, type: :model do
  describe "relationships" do
    it { should belong_to(:amusement_park) }
    it { should have_many(:mechanics) }
    it { should have_many(:mechanic_rides) }
  end
end