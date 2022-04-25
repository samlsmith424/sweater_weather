require 'rails_helper'

RSpec.describe 'munchies request' do
  it 'can retrieve food and forecast info for a destination city' do
    info = {
      start:  "denver, co",
      destination:  "pueblo, co",
      food:  "cheese"
    }

    get "/api/v1/munchies", params: info

    expect(response).to be_successful
  end
end
