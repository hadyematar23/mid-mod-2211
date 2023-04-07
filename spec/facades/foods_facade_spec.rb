require 'rails_helper'

RSpec.describe FoodsFacade do

  describe "FoodsFacade" do 
    before :each do 
      @foods_facade = FoodsFacade.new
    end

    describe "it intakes the JSON hash which contain multiple hashes and outputs Food Items as ruby objects" do 
      it "retreive_foods objects" do 
        results = @foods_facade.retrieve_foods("sweet potatoes")
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
    end
  end 
end 