class UserSerializer
  include JSONAPI::Serializer
  set_id :id
  set_type :users
  attributes :email, :auth_token
  # def self.new(user)
  #   {
  #     "data": {
  #       "type": "users",
  #       "id": user.id.to_s,
  #       "attributes": {
  #         "email": user.email,
  #         "api_key": user.api_key
  #       }
  #     }
  #   }
  # end
end
