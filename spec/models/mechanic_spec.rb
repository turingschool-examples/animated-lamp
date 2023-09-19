require "rails_helper"

RSpec.describe Mechanic, type: :model do
  describe "relationships" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:years_experience) }

    it { should have_many(:mechanics_rides) }
    it { should have_many(:rides).through(:mechanics_rides) }
  end
end