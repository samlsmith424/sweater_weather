class UserSerializer
  include JSONAPI::Serializer
  set_id :id
  set_type :users
  attributes :email, :auth_token
end
