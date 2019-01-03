class Craft < ActiveRecord::Base
    has_many :craft_materials, inverse_of: :craft
    has_many :materials, through: :craft_materials
    has_many :projects
    has_many :users, through: :projects
    accepts_nested_attributes_for  :craft_materials, :reject_if => :all_blank
    
    validates :title, presence: true
    validates :description, presence: true
    validates :method, presence: true
    validates :source, presence: true
    validates_associated :craft_materials
    # validates_associated :materials
    # validates :craft_materials, presence: {message: "Craft material can't be blank."}
    
    scope :knitting, -> { where(method: 'knitting') }
    scope :filter, -> (method) { where("method like ?", "#{method}%")}
    # scope :has_material, -> (material) { where(material: material)}
    
    def self.has_liberty
        joins(:materials).where(materials: {name: "Liberty Lawn"})
    end
    
    def self.has_material(material_name)
        joins(:materials).where(materials: {name: material_name})
    end
end