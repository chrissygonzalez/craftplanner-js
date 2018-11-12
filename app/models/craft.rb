class Craft < ActiveRecord::Base
    has_many :craft_materials
    has_many :materials, through: :craft_materials
    has_many :projects
    has_many :users, through: :projects
    accepts_nested_attributes_for :materials, :craft_materials
    # validates_associated :materials
    
    validates :title, :description, :method, :source, presence: true
end