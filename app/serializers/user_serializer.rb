class UserSerializer
  include JSONAPI::Serializer
  attributes :email, :password
end
