require 'rails_helper'

RSpec.describe YelpPoro do
  it 'can attain restaurant attributes' do
    restaurant_info = {
      :id=>"HQAvMHxMESvv0Gwfm64RQg",
      :alias=>"springside-cheese-shop-pueblo",
      :name=>"Springside Cheese Shop",
      :image_url=>"https://s3-media2.fl.yelpcdn.com/bphoto/A3mHmZSt8VTCeIharo0V8g/o.jpg",
      :is_closed=>false,
      :url=>
      "https://www.yelp.com/biz/springside-cheese-shop-pueblo?adjust_creative=ah6b55fG7Jdfnl4170AXEQ&utm_campaign=yelp_api_v3&utm_medium=api_v3_business_search&utm_source=ah6b55fG7Jdfnl4170AXEQ",
      :review_count=>13,
      :categories=>[{:alias=>"cheese", :title=>"Cheese Shops"}],
      :rating=>5.0,
      :coordinates=>{:latitude=>38.2717031, :longitude=>-104.6140442},
      :transactions=>[],
      :price=>"$$$",
      :location=>
      {:address1=>"517 W 5th St",
       :address2=>"Ste 104",
       :address3=>"",
       :city=>"Pueblo",
       :zip_code=>"81003",
       :country=>"US",
       :state=>"CO",
       :display_address=>["517 W 5th St", "Ste 104", "Pueblo, CO 81003"]},
      :phone=>"+17196969120",
      :display_phone=>"(719) 696-9120",
      :distance=>3554.4487283971584
    }
    data = YelpPoro.new(restaurant_info)
    expect(data.name).to eq("Springside Cheese Shop")
    expect(data.address).to eq("517 W 5th St, Ste 104, Pueblo, CO 81003")
    expect(data.is_closed).to eq(false)
    expect(data.category).to eq("cheese")
  end
end
