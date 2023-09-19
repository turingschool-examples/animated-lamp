require "rails_helper"

RSpec.describe "Amusement Park Show page", type: :feature do
  before :each do
    load_test_data
  end

  # User Story 3
  it "Then I see the name and price of admissions for that amusement park " do
    visit "/amusement_parks/#{@amusement_park_1.id}"

    save_and_open_page
    
    expect(page).to have_content("#{@amusement_park_1.name}")
    expect(page).to have_content("#{@amusement_park_1.admission_cost}")
    expect(page).to have_content("#{@mechanic_1.name}")
    expect(page).to have_content("#{@mechanic_2.name}")
    expect(page).to have_content("#{@mechanic_3.name}")
  end


end