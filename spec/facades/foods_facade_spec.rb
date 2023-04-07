require 'rails_helper'

RSpec.describe FoodsFacade do

  describe "FoodsFacade" do 
    before :each do 
      @foods_facade = FoodsFacade.new("sweet potatoes")
    end

    describe "it intakes the JSON hash from the services which contain different information and outputs ruby objects" do 
      it "retreive_foods objects" do 
        results = @foods_facade.retrieve_foods
        expect(results).to be_a(Array)
        expect(results.count).to eq(10)

        results.each do |food|
          gtin = food.gtin 
          description = food.description
          brand = food.brand
          ingredients = food.ingredients

          expect(food).to be_an_instance_of(Food)
          expect(food).to have_attributes(gtin: gtin, description: description, brand: brand, ingredients: ingredients)
        end
      end 

      it "retreives total hits as a PORO object too" do 
        results = @foods_facade.retrieve_total_hits
        expect(results).to be_an_instance_of(TotalHits)
        expect(results.total_hits).to be_a(Integer)
      end
    end
  end 
end 