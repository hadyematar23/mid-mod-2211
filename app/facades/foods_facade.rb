class FoodsFacade

  def initialize(search_term) 
    @retrieved_food ||= FoodsService.new.make_food_search_api(search_term)
  end

  def retrieve_foods  
    @retrieved_food[:foods].map do |each_food|
     Food.new(each_food)
    end
  end 

  def retrieve_total_hits
    TotalHits.new(@retrieved_food[:totalHits])
  end

end