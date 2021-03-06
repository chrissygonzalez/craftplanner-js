class CraftMaterial < ActiveRecord::Base
    belongs_to :craft, inverse_of: :craft_materials
    belongs_to :material, inverse_of: :craft_materials
    
    accepts_nested_attributes_for :material, :reject_if => :all_blank
    
    validates :quantity, presence: true
    validates_presence_of :material
    # validates :material_id, presence: { message: "Material can't be blank."}
end