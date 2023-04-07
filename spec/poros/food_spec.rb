require 'rails_helper'

RSpec.describe Food do

  describe "Food Poro" do 
    before :each do 
      @food = Food.new({:fdcId=>983525,
        :description=>"SWEET POTATOES",
        :dataType=>"Branded",
        :gtinUpc=>"8901020020844",
        :publishedDate=>"2020-06-26",
        :brandOwner=>"NOT A BRANDED ITEM",
        :ingredients=>"ORGANIC SWEET POTATOES."})
    end

    describe "the food object" do
      it "it exists as a plain old ruby object" do 
        expect(@food).to be_an_instance_of(Food)

      end

      it "has certain attributes" do 
        expect(@food.description).to eq("SWEET POTATOES")
        expect(@food.brand).to eq("NOT A BRANDED ITEM")
        expect(@food.gtin).to eq(8901020020844)
        expect(@food.ingredients).to eq("ORGANIC SWEET POTATOES.")
      end
    end 
  end 
end 