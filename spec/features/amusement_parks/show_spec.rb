require "rails_helper"

RSpec.describe "Amusement Parks Show Page", type: :feature do
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

  describe "As a visitor" do
    describe "When I visit an amusement parks show page" do
      it "displays the name and price of admissions for that amusement park and I see the names of all mechanics that are working on that parks rides and I see that the list of mechanics is unique" do
        visit "/amusement_parks/#{@elitch_gardens.id}"

        expect(page).to have_content(@elitch_gardens.name)
        expect(page).to have_content("Price of Admission: #{@elitch_gardens.admission_cost}")
        expect(page).to have_content("Mechanics working on rides at #{@elitch_gardens.name}:")
        expect(page).to have_content(@sharon.name)
        expect(page).to have_content(@maria.name)
      end
    end
  end
end