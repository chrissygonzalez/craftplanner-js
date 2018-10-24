class Craft < ActiveRecord::Base
    has_many :supplies
    has_many :materials, through: :supplies
    has_many :projects
    has_many :users, through: :projects
end