class Craft < ActiveRecord::Base
    has_many :craft_materials
    has_many :materials, through: :craft_materials
    has_many :projects
    has_many :users, through: :projects
    accepts_nested_attributes_for :materials, :craft_materials, :reject_if => :all_blank
    # validates_associated :materials
    
    validates :title, :description, :method, :source, presence: true
    
    # validates_associated :craft_materials, :at_least_one_material
    
    def all_blank_but_one
        craft_materials.first.blank && attributes['quantity'].blank? && attributes['material_id'].blank?
    end

  private
    def at_least_one_material
        # binding.pry
      errors.add(:base, "You must provide at least 1 material") unless craft_materials.first
    end
end