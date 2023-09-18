require "rails_helper"

RSpec.describe AmusementPark, type: :model do
  describe "relationships" do
    it { should have_many(:rides) }
    it { should have_many(:mechanics).through(:rides) }
  end

  describe "validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :admission_cost }
  end

  before :each do
    @sharon = Mechanic.create!(name: "Sharon", years_experience: 15)
    @maria = Mechanic.create!(name: "Maria", years_experience: 20)
    
    @elitch_gardens = AmusementPark.create!(name: "Elitch Gardens", admission_cost: 65)
    
    @twister = @elitch_gardens.rides.create!(name: "Twister", thrill_rating: 6, open: true)
    @carousel = @elitch_gardens.rides.create!(name: "Carousel", thrill_rating: 2, open: true)
    @dragon_force = @elitch_gardens.rides.create!(name: "Dragon Force", thrill_rating: 10, open: true)

    MechanicRide.create!(mechanic: @sharon, ride: @twister)
    MechanicRide.create!(mechanic: @sharon, ride: @carousel)
    MechanicRide.create!(mechanic: @maria, ride: @twister)
    MechanicRide.create!(mechanic: @maria, ride: @carousel)
  end

  describe "ride_mechanics" do
    it "returns the mechanics who work on rides at the given amusement park" do
      query = @elitch_gardens.ride_mechanics

      expect(query).to eq([@sharon, @maria])
    end
  end
end