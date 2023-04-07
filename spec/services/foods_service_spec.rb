require 'rails_helper'

RSpec.describe FoodsService do

  describe "FoodsService" do 
    before :each do 
      @foods_services = FoodsService.new
    end

    it "creates a Faraday connection to the URL https://api.nal.usda.gov/fdc/v1/" do 
      expect(@foods_services.connection).to be_an_instance_of(Faraday::Connection)
      expect(@foods_services.connection.url_prefix.to_s).to include("https://api.nal.usda.gov/fdc/v1/")
      expect(@foods_services.connection.params["api_key"]).to eq(ENV['API_KEY'])
      expect(@foods_services.connection.params["pageSize"]).to eq("10")
      expect(@foods_services.connection.params["pageNumber"]).to eq("1")
    end

    it "returns JSON with all the info" do 
      results = @foods_services.make_food_search_api("sweet potatoes")
      expect(results).to be_a(Hash)
      expect(results[:foods]).to be_a(Array)
      expect(results[:foods].count).to eq(10)
      results[:foods].each do |food_hash|
        expect(food_hash[:description]).to be_a(String)
        expect(food_hash[:gtinUpc].to_i).to be_a(Integer)
        expect(food_hash[:brandOwner]).to be_a(String)
        expect(food_hash[:ingredients]).to be_a(String)
      end
      expect(results[:totalHits]).to be_a(Integer)
    end

    it "renders only ten items within the JSON hash" do 
      results = @foods_services.make_food_search_api("sweet potatoes")
      expect(results[:foods].count).to eq(10)
      results[:foods].each do |food_json|
        expect(food_json).to have_key(:description)
        expect(food_json).to have_key(:brandOwner)
        expect(food_json).to have_key(:gtinUpc)
        expect(food_json).to have_key(:ingredients)
      end
    end
  end 
end 