require 'rails_helper'

RSpec.describe "As a user when I visit '/mechanics/:id" do
  before :each do
    load_test_data
  end

  # User Story 1
  it "I see their name, years of experience, and the rides they're working on" do
    visit "/mechanics/#{@kara.id}"

    expect(page).to have_content(@kara.name)
    expect(page).to have_content(@kara.years_experience)

    within("#rides_working_on") do
      within("#ride-#{@hurler.id}") do
        expect(page).to have_content(@hurler.name)
      end

      within("#ride-#{@scrambler.id}") do
        expect(page).to have_content(@scrambler.name)
      end

      expect(page).not_to have_content(@ferris.name)
    end
  end

  # User Story 2
  it "I see a form to add a ride to their workload" do
    visit "/mechanics/#{@kara.id}"

    within("#add_ride") do
      fill_in :ride_id, with: "#{@ferris.id}"

      click_button "Add Ride"
    end

    expect(current_path).to eq("/mechanics/#{@kara.id}")

    within("#rides_working_on") do
      within("#ride-#{@ferris.id}") do
        expect(page).to have_content(@ferris.name)
      end
    end
  end
end