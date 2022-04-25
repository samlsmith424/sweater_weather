class YelpFacade
  def self.get_restaurant(food, destination)
    restaurant = YelpService.find_restaurant(food, destination)[:businesses][0]
    # require "pry"; binding.pry
    YelpPoro.new(restaurant)
  end
end
