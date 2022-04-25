class YelpFacade
  def self.get_restaurant(food, destination)
    restaurant = YelpService.find_restaurant(food, destination)
  end
end
