class FoodsService
  def make_food_search_api(search_term)
    get_url("foods/search?query=#{search_term}")
  end

  def get_url(url)
    response = connection.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def connection 
    Faraday.new(url: "https://api.nal.usda.gov/fdc/v1/") do |f|
      f.params["api_key"] = ENV['API_KEY']
      f.params["pageSize"] = "10"
      f.params["pageNumber"] = "1"
    end
  end
end