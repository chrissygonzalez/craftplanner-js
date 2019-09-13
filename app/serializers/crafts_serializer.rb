class CraftsSerializer < ActiveModel::Serializer
  attributes :id, :title, :method, :craft_materials
end
