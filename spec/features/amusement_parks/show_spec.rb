require "rails_helper"

RSpec.describe "Amusement Parks Show Page", type: :feature do
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

      it "displays a list of all of the parks rides, and next to the ride name I see the average experience of the mechanics working on the ride, and I see the list of rides is ordered by the average experience of mechanics working on the ride" do
        visit "/amusement_parks/#{@elitch_gardens.id}"

        expect(page).to have_content("#{@elitch_gardens.name}'s Rides:")
        expect(page).to have_content("#{@twister.name}, Mechanic Average Experience: 16")
        expect(page).to have_content("#{@carousel.name}, Mechanic Average Experience: 8")
        expect(page).to have_content("#{@dragon_force.name}, Mechanic Average Experience: 12")

        expect(@carousel.name).to appear_before(@dragon_force.name)
        expect(@dragon_force.name).to appear_before(@twister.name)
      end
    end
  end
end