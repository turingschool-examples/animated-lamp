require 'rails_helper'

RSpec.describe "Amusement Park Show", type: :feature do
  before(:each) do

  end
  
  describe "When I visit the amusement park show page" do
    it "I see the name and price of admission for the park" do
      visit "/amusement_parks/#{@park_1.id}"

      expect(page).to have_content("Name: #{@park_1.name}")
      expect(page).to have_content("Admission Fee: $#{@park_1.admission_cost}")
    end

    it "I see a unique list of all mechanics working at that park" do
      visit "/amusement_parks/#{@park_1.id}"

      within("#mechanics") do
        expect(page).to have_content("#{@mechanic_1.name} #{@mechanic_2.name}")
        expect(page).to_not have_content("#{@mechanic_1.name} #{@mechanic_1.name} #{@mechanic_2.name}")
      end
    end
  end
end