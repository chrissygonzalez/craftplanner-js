class Material < ActiveRecord::Base
    has_many :supplies
    has_many :crafts, through: :supplies
end