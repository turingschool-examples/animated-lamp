require "rails_helper"

RSpec.describe Ride, type: :model do
  describe "relationships" do
    it { should belong_to(:amusement_park) }
    it { should have_many(:mechanics).through(:ride_mechanics)}
  end

  describe "validations" do 
    it { should validate_presence_of :name }
    it { should allow_value(true).for(:open) }
    it { should allow_value(false).for(:open) }
  end
end