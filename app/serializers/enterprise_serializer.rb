class EnterpriseSerializer
  include JSONAPI::Serializer
  attributes :id, :nit, :address, :mobile
end
