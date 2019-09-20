class MaterialsSerializer < ActiveModel::Serializer
  attributes :id, :name, :crafts

  has_many :crafts
end
