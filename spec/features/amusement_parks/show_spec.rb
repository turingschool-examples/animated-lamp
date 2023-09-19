require 'rails_helper'

RSpec.describe "As a visitor when I visit '/amusement_parks/:id" do
  before :each do
    load_test_data
  end

  # User Story 3
  it "I see the name and price of admissions for that amusement park" do
    visit "/amusement_parks/#{@six_flags.id}"

    expect(page).to have_content(@six_flags.name)
    expect(page).to have_content("Admission Cost: #{@six_flags.admission_cost}")
  end

  it "I see a unique list of mechanics working at the park" do
    visit "/amusement_parks/#{@six_flags.id}"

    within("#mechanics") do
      expect(page).to have_content(@kara.name)
      expect(page).to have_content(@bart.name)
      expect(page).not_to have_content(@teddy.name)
    end
  end

  # Extension
  xit "I see a list of all of the park's rides ordered by average experience of the mechanics working on the ride" do
    visit "/amusement_parks/#{@six_flags.id}"

    within("#rides") do
      expect(@ferris.name).to appear_before(@hurler.name)
      expect(@hurler.name).to appear_before(@scrambler.name)
      expect(page).not_to have_content(@jaws.name)

      within("#ride-#{@ferris.id}") do
        expect(page).to have_content(@ferris.name)
        expect(page).to have_content("Average Experience of Mechanics: #{@hurler.average_experience}")
      end
    end
  end
end