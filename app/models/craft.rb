class Craft < ActiveRecord::Base
    has_many :craft_materials
    has_many :materials, through: :craft_materials

    has_many :projects
    has_many :users, through: :projects
end