class BackgroundImage
  attr_reader :location,
              :photo_credit,
              :image_url

  def initialize(data)
    @location = data[:user][:location]
    @photo_credit = data[:user][:name]
    @image_url = data[:urls][:full]
  end
end
