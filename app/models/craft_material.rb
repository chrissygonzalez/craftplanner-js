class CraftMaterial < ActiveRecord::Base
    belongs_to :craft
    belongs_to :material
end