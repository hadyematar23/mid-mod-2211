require 'rails_helper'

RSpec.describe "Parks Index Page", type: :feature do
  describe "search on the landing page" do 
    it "when search on the landing page and click submit you should be taken to the foods index page" do 
      visit "/"

      fill_in "q", with: "sweet potatoes"
      click_on "Search"
      save_and_open_page
      expect(current_path).to eq("/foods")
      expect(page).to have_content("Results")
      expect(page).to have_selector('#food_result', count: 10)
    end
  end
end 