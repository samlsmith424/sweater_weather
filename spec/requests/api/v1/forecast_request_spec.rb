require 'rails_helper'

RSpec.describe 'weather endpoint' do
  it 'search for a geographic location' do
    VCR.use_cassette("Denver location and weather") do
      location = "Denver, CO"
      get "/api/v1/forecast?location=#{location}"

      # require "pry"; binding.pry
      expect(response).to be_successful
    end
  end
end
