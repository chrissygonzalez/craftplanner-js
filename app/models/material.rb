class Material < ActiveRecord::Base
    has_many :craft_materials, inverse_of: :material
    has_many :crafts, through: :craft_materials
    
    has_many :user_materials
    has_many :users, through: :user_materials
    
    validates :name, presence: true
    
    def self.alphabetize
        Material.all.sort_by { |obj| obj.name.downcase }
    end
end