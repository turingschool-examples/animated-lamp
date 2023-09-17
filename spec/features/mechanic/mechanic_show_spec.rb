require 'rails_helper'

RSpec.describe 'Mechanic Show Page', type: :feature do

    before(:each) do
        @mechanic = Mechanic.create!(name: 'Kara Smith', years_experience: 11)
      
        @six_flags = AmusementPark.create!(name: 'Six Flags', admission_cost: 75)
        @universal = AmusementPark.create!(name: 'Universal Studios', admission_cost: 80)
      
        @hurler = @six_flags.rides.create!(name: 'The Hurler', thrill_rating: 7, open: true)
        @scrambler = @six_flags.rides.create!(name: 'The Scrambler', thrill_rating: 4, open: true)
        @ferris = @six_flags.rides.create!(name: 'Ferris Wheel', thrill_rating: 7, open: false)
      
        @jaws = @universal.rides.create!(name: 'Jaws', thrill_rating: 5, open: true)
      
        @mechanic.rides << @hurler
    end
      
  it 'displays the mechanic information' do
    visit "/mechanics/#{@mechanic.id}"
    expect(page).to have_content('Kara Smith')
    expect(page).to have_content('Years of Experience: 11')
  end

  it 'displays the rides they are working on' do
    visit "/mechanics/#{@mechanic.id}"
    expect(page).to have_content('Rides Mechanic works on:')
    expect(page).to have_content('The Hurler')
  end

  it 'has a form to add a ride to mechanic' do
    visit "/mechanics/#{@mechanic.id}"

    expect(page).to_not have_content(@scrambler.name)
    expect(page).to_not have_content(@ferris.name)
    expect(page).to have_button("Add ride")

    fill_in(:ride_id, with: @ferris.id)
    click_button("Add ride")

    expect(current_path).to eq("/mechanics/#{@mechanic.id}")

  end
end




