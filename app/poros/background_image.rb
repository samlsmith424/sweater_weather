class BackgroundImage
  attr_reader :location,
              :photo_credit,
              :url

  def initialize(data)
    @location = data[:user][:location]
    @photo_credit = data[:user][:name]
    @url = data[:urls][:full]
  end
end
