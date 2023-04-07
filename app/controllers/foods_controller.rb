class FoodsController < ApplicationController
  before_action :create_facade 

  def index 
    @results = @facade.retrieve_foods(params[:q])
    @total_hits = @facade.retrieve_total_hits(params[:q])
  end

  private 

  def create_facade 
    @facade ||= FoodsFacade.new
  end
end
