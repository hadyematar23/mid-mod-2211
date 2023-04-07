require 'rails_helper'

RSpec.describe TotalHits do

  describe "Total Poro" do 
    before :each do 
      @total_hit = TotalHits.new(23)
    end

    describe "the total hits object" do
      it "it exists as a plain old ruby object" do 
        expect(@total_hit).to be_an_instance_of(TotalHits)

      end

      it "has certain attributes" do 
        expect(@total_hit.total_hits).to eq(23)
      end
    end 
  end 
end 