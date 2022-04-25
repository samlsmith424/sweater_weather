class YelpFacade
  def self.get_restaurant(food, destination)
    restaurant_info = YelpService.find_restaurant(food, destination)
    restaurant_info[:businesses].map do |restaurant|
      YelpPoro.new(restaurant)
    end
  end
end
