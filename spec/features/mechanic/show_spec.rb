require "rails_helper"

RSpec.describe "When I visit a mechanic show page", type: :feature do
  before :each do
    load_test_data
  end

  # User Story 1
  it "I see their name, years of experience, and the names of all rides they are working on. " do
    visit "/mechanics/#{@mechanic_3.id}"
    
    expect(page).to have_content("#{@mechanic_3.name}")
    expect(page).to have_content("#{@mechanic_3.years_experience}")
    expect(page).to have_content("#{@ride_1.name}")
    expect(page).to have_content("#{@ride_2.name}")
  end

    # User Story 2
    it "add ride  " do
      visit "/mechanics/#{@mechanic_3.id}"

      expect(page).to have_content("#{@mechanic_3.name}")
      expect(page).to have_content("#{@mechanic_3.years_experience}")
      expect(page).to have_content("#{@ride_1.name}")
      expect(page).to have_content("#{@ride_2.name}")

      fill_in "ride_id", with: "#{@ride_3.id}"

      click_button "Submit"

      expect(current_path).to eq("/mechanics/#{@mechanic_3.id}")
      
      expect(page).to have_content("#{@mechanic_3.name}")
      expect(page).to have_content("#{@mechanic_3.years_experience}")
      expect(page).to have_content("#{@ride_1.name}")
      expect(page).to have_content("#{@ride_2.name}")
      expect(page).to have_content("#{@ride_3.name}")

    end

end
