class FoodsController < ApplicationController
  before_action :create_facade 

  def index 
    @results = @facade.retrieve_foods
    @total_hits = @facade.retrieve_total_hits
  end

  private 

  def create_facade 
    @facade ||= FoodsFacade.new(params[:q])
  end
end
