require 'rails_helper'

RSpec.describe BackgroundImage do
  it 'can return information about a photo' do
    data = {
      :id=>"zSm5JPgNeuc",
      :created_at=>"2021-08-16T21:22:29-04:00",
      :updated_at=>"2022-04-23T12:23:30-04:00",
      :promoted_at=>"2022-02-24T20:24:02-05:00",
      :width=>4392,
      :height=>6588,
      :color=>"#d9c0c0",
      :blur_hash=>"LaJ@:y%2%fWB~q%2IoaxE1f7M{WV",
      :description=>"Boho Girl\n\nModel : @peanutphysique",
      :alt_description=>"woman in white tank top sitting on brown wooden chair",
      :urls=>
      {:raw=>
        "https://images.unsplash.com/photo-1629163330223-c183571735a1?ixid=MnwzMjIxODV8MHwxfHNlYXJjaHwxfHxEZW52ZXIlMkMlMjBDT3xlbnwwfHx8fDE2NTA3ODM3NzU&ixlib=rb-1.2.1",
       :full=>
        "https://images.unsplash.com/photo-1629163330223-c183571735a1?crop=entropy&cs=srgb&fm=jpg&ixid=MnwzMjIxODV8MHwxfHNlYXJjaHwxfHxEZW52ZXIlMkMlMjBDT3xlbnwwfHx8fDE2NTA3ODM3NzU&ixlib=rb-1.2.1&q=85",
       :regular=>
        "https://images.unsplash.com/photo-1629163330223-c183571735a1?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwzMjIxODV8MHwxfHNlYXJjaHwxfHxEZW52ZXIlMkMlMjBDT3xlbnwwfHx8fDE2NTA3ODM3NzU&ixlib=rb-1.2.1&q=80&w=1080",
       :small=>
        "https://images.unsplash.com/photo-1629163330223-c183571735a1?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwzMjIxODV8MHwxfHNlYXJjaHwxfHxEZW52ZXIlMkMlMjBDT3xlbnwwfHx8fDE2NTA3ODM3NzU&ixlib=rb-1.2.1&q=80&w=400",
       :thumb=>
        "https://images.unsplash.com/photo-1629163330223-c183571735a1?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwzMjIxODV8MHwxfHNlYXJjaHwxfHxEZW52ZXIlMkMlMjBDT3xlbnwwfHx8fDE2NTA3ODM3NzU&ixlib=rb-1.2.1&q=80&w=200",
       :small_s3=>"https://s3.us-west-2.amazonaws.com/images.unsplash.com/small/photo-1629163330223-c183571735a1"},
      :links=>
      {:self=>"https://api.unsplash.com/photos/zSm5JPgNeuc",
       :html=>"https://unsplash.com/photos/zSm5JPgNeuc",
       :download=>
        "https://unsplash.com/photos/zSm5JPgNeuc/download?ixid=MnwzMjIxODV8MHwxfHNlYXJjaHwxfHxEZW52ZXIlMkMlMjBDT3xlbnwwfHx8fDE2NTA3ODM3NzU",
       :download_location=>
        "https://api.unsplash.com/photos/zSm5JPgNeuc/download?ixid=MnwzMjIxODV8MHwxfHNlYXJjaHwxfHxEZW52ZXIlMkMlMjBDT3xlbnwwfHx8fDE2NTA3ODM3NzU"},
      :categories=>[],
      :likes=>70,
      :liked_by_user=>false,
      :current_user_collections=>[],
      :sponsorship=>nil,
      :topic_submissions=>{:spirituality=>{:status=>"approved", :approved_on=>"2022-02-25T12:59:43-05:00"}},
      :user=>
      {:id=>"FZ9entlYhv0",
       :updated_at=>"2022-04-23T22:41:08-04:00",
       :username=>"tayloradaugherty",
       :name=>"Taylor Daugherty",
       :first_name=>"Taylor",
       :last_name=>"Daugherty",
       :twitter_username=>nil,
       :portfolio_url=>"http://taylordaugherty.com",
       :bio=>"IG: Tayloradaugherty",
       :location=>"Saint Petersburg, Florida",
       :links=>
        {:self=>"https://api.unsplash.com/users/tayloradaugherty",
         :html=>"https://unsplash.com/@tayloradaugherty",
         :photos=>"https://api.unsplash.com/users/tayloradaugherty/photos",
         :likes=>"https://api.unsplash.com/users/tayloradaugherty/likes",
         :portfolio=>"https://api.unsplash.com/users/tayloradaugherty/portfolio",
         :following=>"https://api.unsplash.com/users/tayloradaugherty/following",
         :followers=>"https://api.unsplash.com/users/tayloradaugherty/followers"},
       :profile_image=>
        {:small=>
          "https://images.unsplash.com/profile-1629165748557-ebeca78a15c3image?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&cs=tinysrgb&fit=crop&h=32&w=32",
         :medium=>
          "https://images.unsplash.com/profile-1629165748557-ebeca78a15c3image?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&cs=tinysrgb&fit=crop&h=64&w=64",
         :large=>
          "https://images.unsplash.com/profile-1629165748557-ebeca78a15c3image?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&cs=tinysrgb&fit=crop&h=128&w=128"},
       :instagram_username=>"tayloradaugherty",
       :total_collections=>0,
       :total_likes=>0,
       :total_photos=>64,
       :accepted_tos=>true,
       :for_hire=>true,
       :social=>
        {:instagram_username=>"tayloradaugherty",
         :portfolio_url=>"http://taylordaugherty.com",
         :twitter_username=>nil,
         :paypal_email=>nil}},
      :tags=>[{:type=>"search", :title=>"usa"}, {:type=>"search", :title=>"co"}, {:type=>"search", :title=>"denver"}]}

    background = BackgroundImage.new(data)

    expect(background).to be_a(BackgroundImage)
    expect(background.image_url).to eq("https://images.unsplash.com/photo-1629163330223-c183571735a1?crop=entropy&cs=srgb&fm=jpg&ixid=MnwzMjIxODV8MHwxfHNlYXJjaHwxfHxEZW52ZXIlMkMlMjBDT3xlbnwwfHx8fDE2NTA3ODM3NzU&ixlib=rb-1.2.1&q=85")
    expect(background.location).to eq("Saint Petersburg, Florida")
    expect(background.photo_credit).to eq("Taylor Daugherty")
  end
end
