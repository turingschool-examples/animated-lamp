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

    expect(@six_flags.hired_mechanics).to match_array([@kara, @bart])

    within("#mechanics") do
      expect(page).to have_content(@kara.name)
      expect(page).to have_content(@bart.name)
      expect(page).not_to have_content(@teddy.name)
    end
  end
end