require "rails_helper"

RSpec.describe MechanicRide, type: :model do
  describe "relationships" do
    it { should belong_to(:mechanics) }
    it { should belong_to(:rides) }
  end
end