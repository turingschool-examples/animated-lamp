require "rails_helper"

RSpec.describe Ride, type: :model do
  describe "relationships" do
    it { should belong_to(:amusement_park) }
    it { should have_many(:mechanic_rides) }
    it { should have_many(:mechanics).through(:mechanic_rides) }
  end

  describe "validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :thrill_rating }
    it { should allow_value(true).for(:open) }
    it { should allow_value(false).for(:open) }
  end

  before :each do
    @sharon = Mechanic.create!(name: "Sharon", years_experience: 12)
    @maria = Mechanic.create!(name: "Maria", years_experience: 20)
    @geraldine = Mechanic.create!(name: "Geraldine", years_experience: 4)
    
    @elitch_gardens = AmusementPark.create!(name: "Elitch Gardens", admission_cost: 65)
    
    @twister = @elitch_gardens.rides.create!(name: "Twister", thrill_rating: 6, open: true)
    @carousel = @elitch_gardens.rides.create!(name: "Carousel", thrill_rating: 2, open: true)
    @dragon_force = @elitch_gardens.rides.create!(name: "Dragon Force", thrill_rating: 10, open: true)

    MechanicRide.create!(mechanic: @sharon, ride: @twister)
    MechanicRide.create!(mechanic: @maria, ride: @twister)
    MechanicRide.create!(mechanic: @sharon, ride: @carousel)
    MechanicRide.create!(mechanic: @geraldine, ride: @carousel)
    MechanicRide.create!(mechanic: @maria, ride: @dragon_force)
    MechanicRide.create!(mechanic: @geraldine, ride: @dragon_force)
  end

  describe "avg_mechanic_experience" do
    it "returns the average number of years of experience between all mechanics working on a ride" do
      query_1 = @twister.avg_mechanic_experience
      query_2 = @carousel.avg_mechanic_experience
      query_3 = @dragon_force.avg_mechanic_experience

      expect(query_1).to eq(16)
      expect(query_2).to eq(8)
      expect(query_3).to eq(12)
    end
  end
end