require 'rails_helper'

RSpec.describe 'background service' do
  it 'can return images based on a search query' do
    VCR.use_cassette("background service") do
      data = BackgroundService.find_background("Denver, CO")

      expect(data).to be_a(Hash)
      expect(data).to have_key(:results)
      expect(data[:results]).to be_an(Array)

      expect(data[:results].first).to have_key(:urls)
      expect(data[:results].first[:urls]).to be_a(Hash)

      expect(data[:results].first).to have_key(:user)
      expect(data[:results].first[:user]).to have_key(:name)
      expect(data[:results].first[:user][:name]).to be_a(String)
    end
  end
end
