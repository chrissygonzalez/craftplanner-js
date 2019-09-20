class CraftsSerializer < ActiveModel::Serializer
  attributes :id, :title, :method, :materials

  has_many :materials
end
