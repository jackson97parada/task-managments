class EmployeeSerializer
  include JSONAPI::Serializer
  attributes :id, :name, :last_name, :document, :mobile
end
