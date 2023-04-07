class FoodsFacade
  def retrieve_foods(search_term)
    retrieved_food = FoodsService.new.make_food_search_api(search_term)
    retrieved_food[:foods].map do |each_food|
     Food.new(each_food)
    end
 end
end