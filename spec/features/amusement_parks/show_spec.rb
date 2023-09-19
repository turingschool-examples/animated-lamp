require "rails_helper"

RSpec.describe "the amusement park show page" do
  it "can return a unique list of every mechanic, as well as all of the amusement park's attributes" do
    meddew = AmusementPark.create!(name: "Meddew", admission_cost: 15)
    mechanic = Mechanic.create!(name: "Terry Lamb", years_experience: 6)
    mechanic_2 = Mechanic.create!(name: "Lerry Tamb", years_experience: 1)
    el_diablo = meddew.rides.create!(name: "El Diablo", thrill_rating: 8, open: true, mechanics: [mechanic, mechanic_2])
    danger = meddew.rides.create!(name: "Danger", thrill_rating: 10, open: false, mechanics: [mechanic])
    carousel = meddew.rides.create!(name: "Carousel", thrill_rating: 2, open: true, mechanics: [mechanic_2])

    visit "/amusement_parks/#{meddew.id}"

    expect(page).to have_content(meddew.name)
    expect(page).to have_content(meddew.admission_cost)
    expect(page).to have_content(mechanic.name)
    expect(page).to have_content(mechanic_2.name)

  end
end