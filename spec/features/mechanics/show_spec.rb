require "rails_helper"

RSpec.describe "the mechanics show page" do
  it "displays the name, years of experience, and the name of all rides they are working on" do
    meddew = AmusementPark.create!(name: "Meddew", admission_cost: 15)
    mechanic = Mechanic.create!(name: "Terry Lamb", years_experience: 6)
    el_diablo = meddew.rides.create!(name: "El Diablo", thrill_rating: 8, open: true, mechanics: [mechanic])
    danger = meddew.rides.create!(name: "Danger", thrill_rating: 10, open: false, mechanics: [mechanic])
    carousel = meddew.rides.create!(name: "Carousel", thrill_rating: 2, open: true, mechanics: [])

    visit "/mechanics/#{mechanic.id}"

    expect(page).to have_content(mechanic.name)
    expect(page).to have_content(mechanic.years_experience)
    expect(page).to have_content(el_diablo.name)
    expect(page).to have_content(danger.name)
    expect(page).not_to have_content(carousel.name)
  end
  it "shows a form to add a new ride" do
    meddew = AmusementPark.create!(name: "Meddew", admission_cost: 15)
    mechanic = Mechanic.create!(name: "Terry Lamb", years_experience: 6)
    el_diablo = meddew.rides.create!(name: "El Diablo", thrill_rating: 8, open: true, mechanics: [mechanic])
    danger = meddew.rides.create!(name: "Danger", thrill_rating: 10, open: false, mechanics: [mechanic])
    carousel = meddew.rides.create!(name: "Carousel", thrill_rating: 2, open: true, mechanics: [])

    visit "/mechanics/#{mechanic.id}"

    expect(page).to have_button("Submit")
  end
  
  it "can add a new ride to a mechanic" do
    meddew = AmusementPark.create!(name: "Meddew", admission_cost: 15)
    mechanic = Mechanic.create!(name: "Terry Lamb", years_experience: 6)
    el_diablo = meddew.rides.create!(name: "El Diablo", thrill_rating: 8, open: true, mechanics: [mechanic])
    danger = meddew.rides.create!(name: "Danger", thrill_rating: 10, open: false, mechanics: [mechanic])
    carousel = meddew.rides.create!(name: "Carousel", thrill_rating: 2, open: true, mechanics: [])

    visit "/mechanics/#{mechanic.id}"

    save_and_open_page

    fill_in( :ride_id, with: carousel.id)
    click_button("Submit")

    expect(page).to have_content(carousel.name)
  end
end