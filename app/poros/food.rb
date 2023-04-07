class Food 
  attr_reader :gtin, 
              :description, 
              :brand, 
              :ingredients
              
  def initialize(info)
    @gtin = info[:gtinUpc].to_i
    @description = info[:description]
    @brand = info[:brandOwner]
    @ingredients = info[:ingredients]
  end

end