require 'rails_helper'

RSpec.describe "Food Index Page", type: :feature do
  describe "search from the landing page" do 
    it "when search on the landing page and click submit you should be taken to the foods index page" do 

      visit "/"

      fill_in "q", with: "sweet potatoes"
      click_on "Search"

      expect(current_path).to eq("/foods")
      
    end 

    it "on the 'foods' page after searching for sweet potatoes, i should see the total number of results returned by the search- in this case over 50,000" do 
      visit "/"

      fill_in "q", with: "sweet potatoes"
      click_on "Search"

      expect(page).to have_content("Total Results")
      within("div#total_results") do 
        expect(page.text).to match(/\d+/)
        total_results = page.text.match(/(\d+)/)[0].to_i
        expect(total_results).to be > 50_000
      end
      
    end

    it "when on the foods index page, you will see that there are results of the search and 10 divs for each food_results, representing the 10 different results" do 

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

      within(first("div#food_result")) do 
        within("div#food_brand") do 
          expect(page.text).to match(/Food Brand:\s*\S+/)
        end
        within("div#food_description") do 
          expect(page.text).to match(/Food Description:\s*\S+/)
        end
        within("div#food_gtin") do 
          expect(page.text).to match(/Food Gtin:\s*\S+/)
        end
        within("div#food_ingredients") do 
          expect(page).to have_content("Food Ingredients:")
        end
      end
    end
  end
end 