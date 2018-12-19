class User < ActiveRecord::Base
    has_many :projects
    has_many :crafts, through: :projects
    
    has_many :user_materials
    has_many :materials, through: :user_materials
    
    validates :name, presence: true
    has_secure_password
end