class TaskSerializer
  include JSONAPI::Serializer
  attributes :id, :title, :description

  belongs_to :tag
end
