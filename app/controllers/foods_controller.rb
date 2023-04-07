class FoodsController < ApplicationController
  def index 
    @results = FoodsFacade.new.retrieve_foods(params[:q])

  end
end
