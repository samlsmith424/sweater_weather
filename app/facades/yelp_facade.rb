class YelpFacade
  def self.get_restaurant(food, destination)
    restaurant = YelpService.find_restaurant(food, destination)[:businesses][0]

    YelpPoro.new(restaurant)
  end
end
