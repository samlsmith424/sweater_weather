class MunchiesSerializer
  def self.new(destination, forecast, travel_time, restaurant)
    {
      "data": {
        "id": "null",
        "type": "munchie",
        "attributes": {
          "destination_city": destination,
          "travel_time": travel_time,
          "forecast": {
            "summary": forecast.current_weather.conditions,
            "temperature": forecast.current_weather.temperature
          },
          "restaurant": {
            "name": restaurant.name,
            "address": restaurant.address
          }
        }
      }
    }
  end
end
