class YelpService
  
  def self.find_restaurant(food, destination)
    response = conn.get("v3/businesses/search") do |require|
      require.params['term'] = food
      require.params['location'] = destination
    end
    parse_json(response)
  end

  private

  def self.conn
    Faraday.new(url: "https://api.yelp.com/") do |require|
      require.headers['Authorization'] = ENV['yelp_api_key']
    end
  end

  def self.parse_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
