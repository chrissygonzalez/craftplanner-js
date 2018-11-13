class Craft < ActiveRecord::Base
    has_many :craft_materials
    has_many :materials, through: :craft_materials
    has_many :projects
    has_many :users, through: :projects
    accepts_nested_attributes_for :materials, :craft_materials, :reject_if => :all_blank
    
    validates :title, presence: { message: "Title can't be blank."}
    validates :description, presence: { message: "Description can't be blank."}
    validates :method, presence: { message: "Method can't be blank."}
    validates :source, presence: { message: "Source can't be blank."}
    validates_presence_of :craft_materials, message: "Material and quantity can't be blank."
    
end