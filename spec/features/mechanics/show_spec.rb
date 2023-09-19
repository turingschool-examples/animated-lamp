require "rails_helper"

RSpec.describe "display individual mechanic" do
  it "displays mechanics with attributes and associated rides" do
    park = AmusementPark.create!(name: "park", admission_cost: 5)

    mechanic = Mechanic.create!(name: "Dave", years_of_experience: 1618)

    swing = Ride.create!(name: "Swing", thrill_rating: 1, open: false, amusement_park: park)
    coaster = Ride.create!(name: "Coaster", thrill_rating: 5, open: false, amusement_park: park)
    drop = Ride.create!(name: "Drop", thrill_rating: 6, open: false, amusement_park: park)

    MechanicRide.create!(mechanic: mechanic, ride: swing)
    MechanicRide.create!(mechanic: mechanic, ride: coaster)
    MechanicRide.create!(mechanic: mechanic, ride: drop)

    visit "mechanics/#{mechanic.id}"

    expect(page).to have_content("Dave")
    expect(page).to have_content("1618")
    expect(page).to have_content("Swing")
    expect(page).to have_content("Coaster")
    expect(page).to have_content("Drop")
  end

  it "can add ride from show page" do
    park = AmusementPark.create!(name: "park", admission_cost: 5)

    mechanic = Mechanic.create!(name: "Dave", years_of_experience: 1618)

    swing = Ride.create!(name: "Swing", thrill_rating: 1, open: false, amusement_park: park)
    coaster = Ride.create!(name: "Coaster", thrill_rating: 5, open: false, amusement_park: park)
    drop = Ride.create!(name: "Drop", thrill_rating: 6, open: false, amusement_park: park)
    spin = Ride.create!(name: "Spin", thrill_rating: 6, open: false, amusement_park: park)

    MechanicRide.create!(mechanic: mechanic, ride: swing)
    MechanicRide.create!(mechanic: mechanic, ride: coaster)
    MechanicRide.create!(mechanic: mechanic, ride: drop)

    visit "mechanics/#{mechanic.id}"

    expect(page).to have_content("Dave")
    expect(page).to_not have_content("Spin")
    
    fill_in "Ride Id:", with: "#{spin.id}"
    click_button "Submit"
    
    expect(page).to have_content("Dave")
    expect(page).to have_content("Spin")
  end






end
