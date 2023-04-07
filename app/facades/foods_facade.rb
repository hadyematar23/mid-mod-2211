class FoodsFacade

  def initialize 
    @service ||= FoodsService.new
  end

  def retrieve_foods(search_term)
    @retrieved_food ||= @service.make_food_search_api(search_term)
    
    @retrieved_food[:foods].map do |each_food|
     Food.new(each_food)
    end
  end 

  def retrieve_total_hits(search_term)
    TotalHits.new(@retrieved_food[:totalHits])
  end

end