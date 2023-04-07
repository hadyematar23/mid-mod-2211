require 'rails_helper'

RSpec.describe "Food Index Page", type: :feature do
  describe "search from the landing page" do 
    it "when search on the landing page and click submit you should be taken to the foods index page" do 

      visit "/"

      fill_in "q", with: "sweet potatoes"
      click_on "Search"
      
    end 

    it "when on the foods index page, you will se that there are results of the search and 10 divs for each food_results, representing the 10 different results" do 

      visit "/"

      fill_in "q", with: "sweet potatoes"
      click_on "Search"

      expect(page).to have_content("Results")
      expect(page).to have_selector('#food_result', count: 10)
    end

    it "each food_result will have certain information listed" do 

      visit "/"

      fill_in "q", with: "sweet potatoes"
      click_on "Search"


      within("div#food_result") do 
        expect(page).to have_content(@contestant_1.hometown)
      end
    end

  end
end 