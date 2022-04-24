class BackgroundSerializer
  def self.new(background)
    {
      "data": {
        "type": "image",
        "id": nil,
        "attributes": {
          "image": {
            "location": background.location,
            "image_url": background.image_url,
            "credit": {
              "source": "unsplash.com",
              "author": background.photo_credit
            }
          }
        }
      }
    }
  end
end
