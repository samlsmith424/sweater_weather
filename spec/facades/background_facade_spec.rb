require 'rails_helper'

RSpec.describe 'background facade' do
  it 'can return image info from a query' do
    VCR.use_cassette("background facade") do
      data = BackgroundFacade.get_background("Denver, CO")

      expect(data).to be_a(BackgroundImage)
    end
  end
end
