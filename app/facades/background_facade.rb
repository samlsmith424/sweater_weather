class BackgroundFacade
  def self.get_background(location)
    data = BackgroundService.find_background(location)[:results][0]
    BackgroundImage.new(data)
  end
end
