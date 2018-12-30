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
    
end