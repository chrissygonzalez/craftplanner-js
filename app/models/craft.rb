class Craft < ActiveRecord::Base
    has_many :craft_materials, inverse_of: :craft
    has_many :materials, through: :craft_materials
    has_many :projects
    has_many :users, through: :projects
    accepts_nested_attributes_for  :craft_materials, :reject_if => :all_blank
    
    validates :title, presence: { message: "Title can't be blank."}
    validates :description, presence: { message: "Description can't be blank."}
    validates :method, presence: { message: "Method can't be blank."}
    validates :source, presence: { message: "Source can't be blank."}
    validates_presence_of :craft_materials
    # validates_presence_of :materials, message: "Material can't be blank."
    
end