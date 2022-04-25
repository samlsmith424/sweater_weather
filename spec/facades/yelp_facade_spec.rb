require 'rails_helper'

RSpec.describe 'yelp facade' do
  it 'can get yelp information' do
    VCR.use_cassette("yelp facade") do
      restaurant_info = YelpFacade.get_restaurant("cheese", "pueblo, co")

      expect(restaurant_info).to be_a(YelpPoro)
    end
  end
end
