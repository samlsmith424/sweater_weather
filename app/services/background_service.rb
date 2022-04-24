class BackgroundService
  def self.find_background(location)
    response = conn.get("/search/photos") do |require|
      require.params['query'] = location
    end
    parse_json(response)
  end

  private

  def self.conn
    Faraday.new(url: "https://api.unsplash.com") do |require|
      require.params['client_id'] = ENV['unsplash_key']
    end
  end

  def self.parse_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
