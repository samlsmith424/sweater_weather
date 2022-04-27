class RoadTripSerializer

  def self.trip_info(travel_time, origin, destination, arrival_weather)
    {
      "data": {
        "id": nil,
        "type": "roadtrip",
        "attributes": {
          "start_city": origin,
          "end_city": destination,
          "travel_time": travel_time,
          "weather_at_eta": {
            "temperature": arrival_weather.temperature,
            "conditions": arrival_weather.conditions
          }
        }
      }
    }
  end

  def self.no_route(travel_time, origin, destination, arrival_weather)
    {
      "data": {
        "id": nil,
        "type": "roadtrip",
        "attributes": {
          "start_city": origin,
          "end_city": destination,
          "travel_time": "impossible",
          # "weather_at_eta": {
          #   "temperature": "",
          #   "conditions": ""
          # }
        }
      }
    }
  end
end
