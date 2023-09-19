require "rails_helper"

RSpec.describe MechanicRide, type: :model do
  before :each do
    load_test_data
  end

  describe "relationships" do
    it { should belong_to(:mechanic) }
    it { should belong_to(:ride) }
  end
end