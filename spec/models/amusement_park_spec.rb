require "rails_helper"

RSpec.describe AmusementPark, type: :model do
  describe "relationships" do
    it { should have_many(:rides) }
    it { should have_many(:mechanics).through(:rides) }
  end

  it "#current_mechanics" do
    mechanic_1 = Mechanic.create!(name: "Bob Johnson", years_experience:12)
    mechanic_2 = Mechanic.create!(name: "Bart Deadlift", years_experience:3)
    mechanic_3 = Mechanic.create!(name: "Max Power", years_experience:2)
    amusement_park = AmusementPark.create!(name:"Six Flags", admission_cost:50)
    ride_1 = amusement_park.rides.create!(name:"Punisher", thrill_rating:5, open:true)
    ride_2 = amusement_park.rides.create!(name:"Hulk", thrill_rating:3, open:true)
    MechanicRide.create!(mechanic_id:mechanic_1.id, ride_id:ride_1.id)
    MechanicRide.create!(mechanic_id:mechanic_2.id, ride_id:ride_2.id)
    MechanicRide.create!(mechanic_id:mechanic_1.id, ride_id:ride_2.id)

    expect(amusement_park.current_mechanics).to eq([mechanic_1,mechanic_2])
  end

  it "#rides_with_average_mechanics_years" do
    mechanic_1 = Mechanic.create!(name: "Bob Johnson", years_experience:12)
    mechanic_2 = Mechanic.create!(name: "Bart Deadlift", years_experience:3)
    mechanic_3 = Mechanic.create!(name: "Max Power", years_experience:2)
    amusement_park = AmusementPark.create!(name:"Six Flags", admission_cost:50)
    ride_1 = amusement_park.rides.create!(name:"Punisher", thrill_rating:5, open:true)
    ride_2 = amusement_park.rides.create!(name:"Hulk", thrill_rating:3, open:true)
    MechanicRide.create!(mechanic_id:mechanic_1.id, ride_id:ride_1.id)
    MechanicRide.create!(mechanic_id:mechanic_2.id, ride_id:ride_1.id)
    MechanicRide.create!(mechanic_id:mechanic_3.id, ride_id:ride_1.id)

    expect(amusement_park.rides_with_average_mechanic_years.first.avg).to eq(5.666666666666667)
  end
end