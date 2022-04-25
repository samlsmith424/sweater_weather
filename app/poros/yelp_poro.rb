class YelpPoro
  attr_reader :name,
              :address,
              :is_closed,
              :category

  def initialize(restaurant_info)
    @name = restaurant_info[:name]
    @address = restaurant_info[:location][:display_address].join(', ')
    @is_closed = restaurant_info[:is_closed]
    @category = restaurant_info[:categories][0][:alias]
  end
end
